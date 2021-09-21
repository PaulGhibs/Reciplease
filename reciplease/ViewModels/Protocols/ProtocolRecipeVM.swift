//
//  ProtocolRecipeVM.swift
//  reciplease
//
//  Created by Paul Ghibeaux on 21/09/2021.
//

import Foundation


protocol RecipeVMProtocol: ViewModel {
    func getRecipes(callback: @escaping (Result<RecipeSuccess, RecipeError>) -> ())
}
