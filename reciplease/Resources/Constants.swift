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
