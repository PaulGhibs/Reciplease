//
//  TableCellViewModel.swift
//  reciplease
//
//  Created by Paul Ghibeaux on 14/09/2021.
//

import Foundation

class RecipeCellViewModel: TableCellViewModel {
    var routingEntry: RoutingEntry?
 
    var estimatedHeight: Float {
        return 50
    }
    
    var height: Float {
        return 100
    }
    
    var indexPath: IndexPath?
    var nibName: String? = "RecipeViewCell"
    lazy var reuseIdentifier: String = String(describing: self)
    
    
    /// Recipes instance
    var recipes : RecipeCollection
  
    var recipe : Recipe
   
    
    init(recipes: RecipeCollection, recipe: Recipe) {
        self.recipes = recipes
        
        self.recipe = recipe
    }
    
    
    
}
