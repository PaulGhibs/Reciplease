//
//  DetailViewSection.swift
//  reciplease
//
//  Created by Paul Ghibeaux on 20/10/2021.
//

import Foundation



class DetailViewSection: Section {
    var position: Int
    
    var title: String
    
    var cellsVM: [CellViewModel]

    
    init(recipe : Recipe) {
        self.position = 1
        self.title = ""
        
        
        
        self.cellsVM = [CellViewModel]()
      
        
        let cellVM = DetailRecipeCellViewModel(name: recipe.name, titleHeader: recipe.name, imageHeader: recipe.imageURL, IngredientsList: recipe.ingredientsNeeded, buttonLike: "like button")
        let greenButton = GreenButtonCellViewModel(title: "Get Directions", routingEntry: nil)

        self.cellsVM.append(cellVM)
        self.cellsVM.append(greenButton)

        
        
        
       
    }
}
