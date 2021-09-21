//
//  DataService.swift
//  reciplease
//
//  Created by Paul Ghibeaux on 14/09/2021.
//



import Foundation
import Alamofire

class AlamoRequest {
    
    // Pattern singleton
    public static let alamoRequest = AlamoRequest()
    
    //API key and app ID
    let apiKey = ""
    let appID = ""
    
    // Set a notification when the recipe are loaded
    static let notificationRecipeLoaded = Notification.Name("recipeLoaded")
    
    // To get the data from the request
    var recipe : Welcome? {
        didSet {
            DispatchQueue.main.async {
                NotificationCenter.default.post(name: AlamoRequest.notificationRecipeLoaded, object: nil, userInfo: nil)
            }
        }
    }
    
    // Public init for pattern singleton
    public init() {}
    
    
    func getRequest(ingredient: String, callback: @escaping(_ result: DataResponse<Welcome, AFError>?) -> Void) {
        
        let parameters = ["q":ingredient,"to":"100","app_id":appID,"app_key":apiKey]
        
        AF.request("https://api.edamam.com/search?", method: .get, parameters: parameters).responseDecodable(of: Welcome.self) { (response) in
            callback(response)
        }
    }
    
}
