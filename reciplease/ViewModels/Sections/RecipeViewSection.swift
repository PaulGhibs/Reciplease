//
//  TableViewSection.swift
//  reciplease
//
//  Created by Paul Ghibeaux on 14/09/2021.
//

import Foundation

// MARK: - RecipeViewSection

class RecipeViewSection: Section {
    var position: Int
    
    var title: String
    
    var cellsVM: [CellViewModel]
    
    
    // recipe collection init
    init(collection : RecipeCollection) {
        self.position = 0
        self.title = ""
        
        self.cellsVM = [CellViewModel]()
        // if no recipes show the emptycellvm
        if collection.recipes.count == 0 {
            let empty = EmptyRecipeCellViewModel()
            cellsVM.append(empty)
        } else {
    // for each recipe display a Recipelistcellviewmodel with name, images and others attributes
            for recipe in collection.recipes {
                let icone = recipe.imageURL
            
                // detail routing entry init if the users click on a cell 
                let cellVM = RecipesListCellViewModel(name: "\(recipe.name)",
                                                 secondName: recipe.ingredientsNeeded,
                                                 image: icone, duration: recipe.duration, numberOfPeople: recipe.numberOfPeople, routingEntry: DetailRoutingEntry(recipe: recipe))
                self.cellsVM.append(cellVM)
            }
            
        }

    }
}
