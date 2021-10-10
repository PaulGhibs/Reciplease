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
    
    

    init(recipes: RecipeCollection) {
        self.position = 0
        self.title = ""
        
        self.cellsVM = [CellViewModel]()
       
        for recipe in recipes.recipes {
            self.cellsVM.append(RecipeCellViewModel(recipes: recipes, recipe: recipe))
            
        }
      
        
   
    }
}
