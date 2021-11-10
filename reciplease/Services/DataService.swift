//
//  DataService.swift
//  reciplease
//
//  Created by Paul Ghibeaux on 14/09/2021.
//


import Foundation
import Alamofire

class RecipeRequest: APIService {
    
    private static let recipe = RecipeCollection(recipes: [])
    
    func requestRecipe(with ingredients: String, callback: @escaping RecipeRequest.Callback) {
        
        let url: URL!
        do {
            url = try RecipeRequest.createURL(with: ingredients)
        } catch {
            return callback(false, nil)
        }
        
        
        AF.request(url, method: .get).responseJSON { response in
            switch response.result {
            case .success:
                let resource: RecipeCollection = RecipeRequest.parse(response.data!)
                print(resource)
                callback(true, resource)
            case .failure(let error):
                print("Error : \(error)" )
                
                callback(false, nil)
                
            }
        }
    }
    
    static func createURL(with ingredients: String) throws -> URL? {
        let completeURL = Endpoint.searchEndpoint + ingredients
        
        
        print("completeURL", completeURL)
        
        return URL(string: completeURL)
    }
    
    static func parse<RecipeCollection: Decodable>(_ data: Data) -> RecipeCollection {
        do {
            let recipe = try JSONDecoder().decode(RecipeCollection.self, from: data)
            return recipe
        } catch DecodingError.dataCorrupted(let context) {
            print(context.debugDescription)
        } catch DecodingError.keyNotFound(let key, let context) {
            print("\(key.stringValue) was not found, \(context.debugDescription)")
        } catch DecodingError.typeMismatch(let type, let context) {
            print("\(type) was expected, \(context.debugDescription)")
        } catch DecodingError.valueNotFound(let type, let context) {
            print("no value was found for \(type), \(context.debugDescription)")
        } catch {
            print("Unknown error")
        }
        
        return RecipeRequest.recipe as! RecipeCollection
    }
    
}



