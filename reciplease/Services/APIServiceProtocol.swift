//
//  APIServiceProtocol.swift
//  reciplease
//
//  Created by Paul Ghibeaux on 02/10/2021.
//

import Foundation
import Alamofire


protocol APIService {
    func getRecipe(ingredient: String, callback: @escaping(_ result: Result<RecipeResponse, AFError>?) -> Void)
}
