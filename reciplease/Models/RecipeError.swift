//
//  RecipeError.swift
//  reciplease
//
//  Created by Paul Ghibeaux on 02/10/2021.
//

import Foundation



enum RecipeError: Error {
    
    case  badURL
    case  noRecipeFound
    case  deletedFromFavorites
    
    func errorMessages() throws -> String {
        switch self {
        case .badURL:
            return NSLocalizedString("badurl", comment: "Oups ! je n'ai rien trouvé a cette adresse")
        case .noRecipeFound:
            return NSLocalizedString("failTofoundRecipe", comment: "Impossible de charger la recette!")
        case .deletedFromFavorites:
            return NSLocalizedString("⚠️", comment: "recipe have deleted from favorites")
    }
}
}


