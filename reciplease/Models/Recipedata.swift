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
// structure to manage data

struct RecipeCollection: Decodable {
    let recipes: [Recipe]

    enum CodingKeys: String, CodingKey {
        case recipes = "hits"
    }
}
struct Recipe {
    let name: String
    let imageURL: URL?
    let url: URL?
    let numberOfPeople: Float
    let duration: Float
    var ingredientsNeeded: [String]
    
  
}

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



struct Ingredients{
    static let ingredients = "ingredients"
}
