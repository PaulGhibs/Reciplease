//
//  DetailViewSection.swift
//  reciplease
//
//  Created by Paul Ghibeaux on 20/10/2021.
//

import Foundation


// MARK: - DetailSection

class DetailViewSection: Section {
    var position: Int
    
    var title: String
    
    var cellsVM: [CellViewModel]

    // recipe init
    init(recipe : Recipe) {
        self.position = 1
        self.title = ""
        self.cellsVM = [CellViewModel]()
        // detail recipe cellvm init
        let cellVM = DetailRecipeCellViewModel(name: recipe.name, titleHeader: recipe.name, imageHeader: recipe.imageURL, IngredientsList: recipe.ingredientsNeeded, duration: recipe.duration, likes: recipe.numberOfPeople, favorites: recipe.isFavorited)
    
        // green button cellvm init & routing entry web for going on the url of recipe when clicked
        let greenButton = GreenButtonCellViewModel(title: "Get Directions", routingEntry: WebRoutingEntry(url: recipe.url))

        self.cellsVM.append(cellVM)
        self.cellsVM.append(greenButton)
         
    }
}
