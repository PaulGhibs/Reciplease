//
//  MockAPIService.swift
//  recipleaseTests
//
//  Created by Paul Ghibeaux on 11/11/2021.
//

import Foundation
@testable import reciplease
import XCTest

class MockService : APIService {

    func requestRecipe(with ingredients: String, callback: @escaping Callback) {
        let url: URL!
        do {
            url = try RecipeRequest.createURL(with: ingredients)
        } catch {
            return callback(false, nil)
        }
    }
    
    static func createURL(with ingredients: String) throws -> URL? {
        let completeURL = "www.blabla.com" + ingredients
        return URL(string: completeURL)
    }
    
    static func parse<Recipe: Decodable>(_ data: Data) -> Recipe {
        do {
            let recipe = try JSONDecoder().decode(Recipe.self, from: data)
            return recipe
        } catch {
            print("Unknown error")
        }
        
        return RecipeRequest.recipe as! Recipe
    }
    
    
}
