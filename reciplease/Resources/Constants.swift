//
//  Constants.swift
//  reciplease
//
//  Created by Paul Ghibeaux on 16/09/2021.
//

import Foundation
// Hide Api key in a property list file and add the name to the .gitignore file
struct Constants {
    static func valueAPIKey(_ nameKey: String) -> String {
        //  path to ApiKeys.plist
        let path = Bundle.main.path(forResource: "APIKeys", ofType: "plist")
        // dictionnary for key
        let plist = NSDictionary(contentsOfFile: path!)
        // result of the key
        let value: String = (plist?.object(forKey: nameKey) as? String)!
        // value of each apikey
        return value
    }
}

/// Assets to access API resources
struct Endpoint {
  
    static let search = "q=chicken"
    //API key and app ID
    static let app_key = Constants.valueAPIKey("appkey")
    static let app_id = Constants.valueAPIKey("appId")
    
    static let from = "&from=0"
    static let to = "&to=100&calories=591-722&health=alcohol-free"
    static let searchEndpoint = "https://api.edamam.com/search?q=chicken&app_id=1076edd2&app_key=544b1da54c3519bcfb84ec16fe78227d&from=0&to=3&calories=591-722&health=alcohol-free" 
    
//https://api.edamam.com/search?q=chicken&app_id=1076edd2&app_key=544b1da54c3519bcfb84ec16fe78227d&from=0&to=3&calories=591-722&health=alcohol-free
}
