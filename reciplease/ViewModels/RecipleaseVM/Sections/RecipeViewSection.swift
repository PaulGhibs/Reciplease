//
//  TableViewSection.swift
//  reciplease
//
//  Created by Paul Ghibeaux on 14/09/2021.
//

import Foundation


class RecipeViewSection: Section {
    var position: Int
    
    var title: String
    
    var cellsVM: [CellViewModel]
    
    

    init(collection : RecipeCollection) {
        self.position = 0
        self.title = ""
        
        self.cellsVM = [CellViewModel]()
      
        
        for recipe in collection.recipes {
            let icone = recipe.imageURL
        
            
            let cellVM = RecipeCellViewModel(name: "\(recipe.name)",
                                             secondName: recipe.ingredientsNeeded,
                                             image: icone, duration: recipe.duration, numberOfPeople: recipe.numberOfPeople, routingEntry: DetailRoutingEntry())
            self.cellsVM.append(cellVM)
        }
        
//        for recipe in recipes.recipes {
//            self.cellsVM.append(RecipeCellViewModel(name: "\(recipe.name)", secondName: "\(recipe.ingredientsNeeded)"))
//
//        }
    

        
   
    }
}
