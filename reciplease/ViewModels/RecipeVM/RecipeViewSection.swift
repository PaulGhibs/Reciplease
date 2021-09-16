//
//  TableViewSection.swift
//  reciplease
//
//  Created by Paul Ghibeaux on 14/09/2021.
//

import Foundation


class recipeViewSection: Section {
    var position: Int
    
    var title: String
    
    var cellsVM: [CellViewModel]

    init() {
        self.position = 0
        self.title = ""
        
        self.cellsVM = [CellViewModel]()
        self.cellsVM.append(RecipeCellViewModel(name: "Numéro "))

        
    }
}
