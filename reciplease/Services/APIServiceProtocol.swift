//
//  APIServiceProtocol.swift
//  reciplease
//
//  Created by Paul Ghibeaux on 02/10/2021.
//

import Foundation


protocol APIService {
     typealias Callback = (Bool, Any?) -> Void
     func requestRecipe(with ingredients: String, callback: @escaping Callback)
     func createURL() throws -> URL?
     func parse <T: Decodable>(_ data: Data) -> T
    
}
