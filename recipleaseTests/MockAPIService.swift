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
    //MARK: - Properties

    var loadDataIsCalled = true
    var completeClosure: ((Result<[RecipeCollection], RecipeError>) -> Void)!
    var fakerecipeTab: [Recipe] = [Recipe]()
    var recipeError: ((RecipeError?)->())!
    var mockrecipe: Result<[Recipe], RecipeError>?
    
    static let recipe = RecipeCollection(recipes: [])

    //MARK: - methods from APIServiceProtocols

    func requestRecipe(with ingredients: String, callback: @escaping Callback) {
        let _: URL! = try? MockService.createURL(with: ingredients)
        callback(false, nil)
      
    }
    
    static func createURL(with ingredients: String) throws -> URL? {
        return try RecipeRequest.createURL(with: ingredients)
    }
    
    static func parse<RecipeCollection: Decodable>(_ data: Data) -> RecipeCollection {
        do {
            let recipe = try JSONDecoder().decode(RecipeCollection.self, from: data)
            return recipe
        } catch {

            print("Unknown error")
        }
        
        return recipe as! RecipeCollection
    }
    
    
    // Fetch Failed
    func fetchFail(error: RecipeError?) {
        guard error != nil else {
            return}
        print("error")

        
    }
    
    
    
    
    
    
}
