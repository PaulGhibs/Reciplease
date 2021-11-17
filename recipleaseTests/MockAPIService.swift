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
    var loadDataIsCalled = true
    var completeClosure: ((Result<[RecipeCollection], RecipeError>) -> Void)!
    var fakerecipeTab: [Recipe] = [Recipe]()
    var recipeError: ((Error?)->())!
    var mockrecipe: Result<[Recipe], RecipeError>?
    
    static let recipe = RecipeCollection(recipes: [])


    func requestRecipe(with ingredients: String, callback: @escaping Callback) {
        
        do {
            let _: URL! = try MockService.createURL(with: ingredients)

        } catch {
            return callback(false, ingredients)
        }
    }
    
    static func createURL(with ingredients: String) throws -> URL? {
        let completeURL = "https://api.edamam.com/search?q=chicken&app_id=e18eed8d&app_key=211716f11ce4f2e390a5a84a0c0725eb&from=0&to=20" + ingredients
        return URL(string: completeURL)
    }
    
    static func parse<RecipeCollection: Decodable>(_ data: Data) -> RecipeCollection {
        do {
            let recipe = try JSONDecoder().decode(RecipeCollection.self, from: data)
            return recipe
        } catch {

            print("Unknown error")
        }
        
        return self.recipe as! RecipeCollection
    }
    
    func fetchFail(error: RecipeError?) {
        guard error != nil else {
            return}
        print("error")

        
    }
    
    
}
