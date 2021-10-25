//
//  RecipeError.swift
//  reciplease
//
//  Created by Paul Ghibeaux on 02/10/2021.
//

import Foundation



enum RecipeError: Error {
    typealias RawValue = String
    
    case  badURL
    case  noRecipeFound
    
    func errorMessages() throws -> String {
        switch self {
        case .badURL:
            return NSLocalizedString("badurl", comment: "Oups ! je n'ai rien trouvé a cette adresse")
        case .noRecipeFound:
            return NSLocalizedString("failTofoundRecipe", comment: "Impossible de charger le produit!")
    }
}
}

enum recipeSuccess {
    case goRouting
    case ingredientsSendWithSuccess
   
    
    func successMessage() -> String{
        
        switch self {
        case .goRouting :
            return ""
        case .ingredientsSendWithSuccess :
            return NSLocalizedString("ingredientsSendWithSuccess", comment: "ingredients send With success")
        
            }
    }
}
