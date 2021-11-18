//
//  DataService.swift
//  reciplease
//
//  Created by Paul Ghibeaux on 14/09/2021.
//


import Foundation
import Alamofire
// MARK: - RecipeRequest class

class RecipeRequest: APIService {
    // MARK: - Properties
    static let recipe = RecipeCollection(recipes: [])
    
    // request list of recipe
    func requestRecipe(with ingredients: String, callback: @escaping RecipeRequest.Callback) {
        // Try api call or return callback false nil if url is good
        let url: URL!
        do {
            url = try RecipeRequest.createURL(with: ingredients)
        } catch {
            return callback(false, nil)
        }
        
        // make the api call with alamo if the adress is good
        
        AF.request(url, method: .get).responseJSON { response in
            // parse data if sucess and callback true with ressources
            switch response.result {
            case .success:
                let resource: RecipeCollection = RecipeRequest.parse(response.data!)
                print(resource)
                callback(true, resource)
                // print error if failure and callback false with nil
            case .failure(let error):
                print("Error : \(error)" )
                
                callback(false, nil)
                
            }
        }
    }
    
    static func createURL(with ingredients: String) throws -> URL? {
        // create url with ingredients typed by users & endpoint made from constants

        let completeURL = Endpoint.searchEndpoint + ingredients
        return URL(string: completeURL)
    }
    
    static func parse<RecipeCollection: Decodable>(_ data: Data) -> RecipeCollection {
        // Decode JSON data to a Decodable type or catch every errors related

        do {
            let recipe = try JSONDecoder().decode(RecipeCollection.self, from: data)
            return recipe
        } catch {
            print("\(String(describing: try? RecipeError.noRecipeFound.errorMessages()))")
        }
       
        // result as recipecollection above
        return self.recipe as! RecipeCollection
    }
    
}



