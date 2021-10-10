//
//  DataService.swift
//  reciplease
//
//  Created by Paul Ghibeaux on 14/09/2021.
//


import Foundation
import Alamofire
import Nuke

class RecipeRequest: APIService {
   
    private static let recipe = RecipeCollection(recipes: [])

     func requestRecipe(with ingredients: String, callback: @escaping RecipeRequest.Callback) {
        

        let url: URL!
             do {
                 url = try createURL()
             } catch {
                 return callback(false, nil)
             }
     
        
             
         AF.request(url, method: .get).responseJSON { response in
                 switch response.result{
                     case .success:
                     let resource: RecipeCollection = self.parse(response.data!)
                     callback(true, resource)
                     case .failure(let error):
                         print("Error : \(error)" )
                     
                     callback(false, nil)

                     }
             }
    }
    
     func createURL() throws -> URL? {
        let completeURL = Endpoint.searchEndpoint
        
               print("completeURL", completeURL)

               return URL(string: completeURL)
    }
    
     func parse<Recipes: Decodable>(_ data: Data) -> Recipes {
        do {
                let recipe = try JSONDecoder().decode(Recipes.self, from: data)
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

                return RecipeRequest.recipe as! Recipes
        }
    


}
    
 
// Perform a  call to get images
struct ImageService {
    /**
     Call to download an image linked to a recipe
     - parameter view: Display the image
     - parameter recipeURL: The image location
     */
    static func getImage(for view: UIImageView, from recipeURL: String?) {
        guard let smallImageURL = recipeURL else {
            print("no small image url")
            return
        }
        guard let url = URL(string: smallImageURL) else {
            print("unable to create small image url")
            return
        }

        let options = ImageLoadingOptions(
            placeholder: UIImage(named: "defaultImage"),
            transition: .fadeIn(duration: 0.3)
        )

        Nuke.loadImage(with: url,
                       options: options,
                       into: view)
    }
}


 
    
    
    



