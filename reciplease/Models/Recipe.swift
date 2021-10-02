//
//  recipe.swift
//  reciplease
//
//  Created by Paul Ghibeaux on 14/09/2021.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseWelcome { response in
//     if let welcome = response.result.value {
//       ...
//     }
//   }

import Foundation

struct RecipeResponse: Decodable {
    let recipes: [Recipe]

    enum CodingKeys: String, CodingKey {
        case recipes = "hits"
    }
}
struct Recipe {
    let name: String
    let imageURL: String?
    let url: String?
    let numberOfPeople: Float
    let duration: Float
    var ingredientsNeeded: [String]
    
    init(from recipeEntity: RecipeEntry) {
        
        self.name = recipeEntity.name ?? "No name"
        self.imageURL = recipeEntity.image ?? "No adress image"
        self.url = recipeEntity.url ?? "No url"
        self.numberOfPeople = recipeEntity.person
        self.duration = recipeEntity.totalTime
        self.ingredientsNeeded = [] // Pas content si je mets seulement la ligne en dessous.
        self.ingredientsNeeded = convertDatasToStringArray(ingredients: recipeEntity.ingredients)
    }
    
    private func convertDatasToStringArray(ingredients: Data?) -> [String] {
        guard let datas = ingredients else { return [] }
            
        
        let data = Data(datas)
        return (try? JSONDecoder().decode([String].self, from: data)) ?? []
    }
}

extension Recipe: Codable {
    
    enum Rename: String, CodingKey {
        case recipe
        case name = "label"
        case imageURL = "image"
        case url
        case numberOfPeople = "yield"
        case duration = "totalTime"
        case ingredientsNeeded = "ingredientLines"

        case totalDaily
        case ENERC_KCAL
        case quantity
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Rename.self)

        let recipe = try container.nestedContainer(keyedBy: Rename.self, forKey: .recipe)

        name = try recipe.decode(String.self, forKey: .name)
        imageURL = try recipe.decode(String.self, forKey: .imageURL)
        url = try recipe.decode(String.self, forKey: .url)
        numberOfPeople = try recipe.decode(Float.self, forKey: .numberOfPeople)
        duration = try recipe.decode(Float.self, forKey: .duration)
        ingredientsNeeded = try recipe.decode([String].self, forKey: .ingredientsNeeded)
    }
}

struct MyObject: Decodable {
    let label: String
    let quantity: Float
    let unit: String
}

extension Recipe: Equatable {
    static func == (lhs: Recipe, rhs: RecipeEntry) -> Bool {
        return lhs.name == rhs.name && lhs.url == rhs.url
    }
}
