//
//  recipe.swift
//  reciplease
//
//  Created by Paul Ghibeaux on 14/09/2021.
//



import Foundation
// MARK: - Structure to manage data

struct RecipeCollection: Decodable {
    // array of recipe
    let recipes: [Recipe]
    
    enum CodingKeys: String, CodingKey {
        case recipes = "hits"
    }
}
struct Recipe {
    // recipe struct with attributes
    let name: String
    let imageURL: URL?
    let url: URL?
    let numberOfPeople: Float
    let duration: Float
    var ingredientsNeeded: [String]
    var isFavorited : Bool?
    // init each attribute
    init(name: String, imageURL: URL?, url: URL?, numberOfPeople: Float, duration : Float,  ingredientsNeeded: [String], isFavorited: Bool?) {
        self.name = name
        self.imageURL = imageURL
        self.url = url
        self.numberOfPeople = numberOfPeople
        self.duration = duration
        self.isFavorited = isFavorited
        self.ingredientsNeeded = ingredientsNeeded
        
    }
}
// converting json struct to swift class
extension Recipe: Codable {
    
    enum Rename: String, CodingKey {
        case recipe
        case name = "label"
        case imageURL = "image"
        case url = "url"
        case numberOfPeople = "yield"
        case duration = "totalTime"
        case ingredientsNeeded = "ingredientLines"
        
    }
    // decode each codingkey from json
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Rename.self)
        
        let recipe = try container.nestedContainer(keyedBy: Rename.self, forKey: .recipe)
        
        name = try recipe.decode(String.self, forKey: .name)
        imageURL = try recipe.decode(URL.self, forKey: .imageURL)
        url = try recipe.decode(URL.self, forKey: .url)
        numberOfPeople = try recipe.decode(Float.self, forKey: .numberOfPeople)
        duration = try recipe.decode(Float.self, forKey: .duration)
        ingredientsNeeded = try recipe.decode([String].self, forKey: .ingredientsNeeded)
    }
}



struct Ingredients {
    // ingredients typed by users
    static let ingredients = "ingredients"
}
