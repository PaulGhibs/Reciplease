//
//  DataService.swift
//  reciplease
//
//  Created by Paul Ghibeaux on 14/09/2021.
//



import Foundation
import Alamofire

class RecipeRequest: APIService {
 

    // Pattern singleton
    public static let alamoRequest = RecipeRequest()
    
    static var shared = RecipeRequest()
        private let session: Session
        init(session: Session = .default) {
            self.session = session
        }
    
    //API key and app ID
    let apiKey = Constants.valueAPIKey("appkey")
    let appID = Constants.valueAPIKey("appId")
    
    // Set a notification when the recipe are loaded
    static let notificationRecipeLoaded = Notification.Name("recipeLoaded")
    
    // To get the data from the request
    var recipe : Recipe? {
        didSet {
            DispatchQueue.main.async {
                NotificationCenter.default.post(name: RecipeRequest.notificationRecipeLoaded, object: nil, userInfo: nil)
            }
        }
    }
    
    // Public init for pattern singleton
    
    
    func getRecipe(ingredient: String, callback: @escaping (Result<RecipeResponse, AFError>?) -> Void) {
        let parameters = ["q":ingredient,"to":"100","app_id":appID,"app_key":apiKey]
        let url = "https://api.edamam.com/search?"
        
        session.request(url, method: .get, parameters: parameters).validate()
            .responseDecodable(of: RecipeResponse.self) { (response) in
                
            callback(response.result)

        }
    }
    
    
    
    
}


