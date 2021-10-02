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
    var recipe : Recipe?
    
    init(recipe : Recipe?) {
        self.recipe = recipe
    }
    
    
    
}
