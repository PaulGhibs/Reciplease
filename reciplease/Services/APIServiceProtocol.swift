//
//  APIServiceProtocol.swift
//  reciplease
//
//  Created by Paul Ghibeaux on 02/10/2021.
//

import Foundation

//  methods to perform API calls
protocol APIService {
    // Provide the state of the edamam response
    typealias Callback = (Bool, Any?) -> Void
    
    func requestRecipe(with ingredients: String, callback: @escaping Callback)
    // Build and return a  URL to access edamam API resources

    static func createURL(with ingredients: String) throws -> URL?
    // Decode JSON data thanks to a Decodable type
    static func parse <T: Decodable>(_ data: Data) -> T
    
}
