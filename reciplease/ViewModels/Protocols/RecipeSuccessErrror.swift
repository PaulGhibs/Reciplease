//
//  RecipeSuccessErrror.swift
//  reciplease
//
//  Created by Paul Ghibeaux on 21/09/2021.
//

import Foundation

enum RecipeError: Error {
    case emptyRecipe
    case recipeNotValide
    case recipeNotFound
    case requiredIngredients
    case failTohaveResults
    case noNetwork
  
    
    func errorMessage() -> String{
        
        switch self {
        case .emptyRecipe :
            return "name recipes are required"
        case .recipeNotValide, .recipeNotFound :
            return "No recipes founds, please check again"
        case .requiredIngredients :
            return "Please add some ingredients"
        case .failTohaveResults :
            return "Sorry nothing found, try again"
        case .noNetwork :
            return "Are you sure you have some network working?"
       
        }
    }
}

enum RecipeSuccess {
    case goRouting
    case nothing
    case recipeFound
    case IngredientsFound
    case FavoriteBackUp

    
    func successMessage() -> String{
        
        switch self {
        case .nothing :
            return ""
        case .goRouting :
            return ""
        case .recipeFound :
            return "Recipes founds"
        case .IngredientsFound :
            return "Ingredients matching recipes "
        case .FavoriteBackUp :
            return "Added recipe to favorite"
      
        }
    }
}
