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
    
    var recipes: Recipe?

    init() {
        self.position = 0
        self.title = ""
    
        self.cellsVM = [CellViewModel]()
       
        self.cellsVM.append(RecipeCellViewModel(recipe: <#Recipe?#>))
   
    }
}
