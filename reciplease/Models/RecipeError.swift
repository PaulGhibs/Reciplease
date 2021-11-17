//
//  RecipeError.swift
//  reciplease
//
//  Created by Paul Ghibeaux on 02/10/2021.
//

import Foundation


// MARK: - Structure to manage error

enum RecipeError: Error {
    // threes possibilities
    case  badURL
    case  noRecipeFound
    case  deletedFromFavorites
    // raised a message for each error as string
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


