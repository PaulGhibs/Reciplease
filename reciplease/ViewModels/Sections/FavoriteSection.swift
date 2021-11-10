//
//  FavoriteSection.swift
//  reciplease
//
//  Created by Paul Ghibeaux on 23/10/2021.
//

import Foundation


class FavoriteSection: Section {
    var position: Int
    
    var title: String
    
    var cellsVM: [CellViewModel]
    
    var collection : RecipeCollection


    init(collection : RecipeCollection) {
        self.position = 0
        self.title = ""
        
        self.cellsVM = [CellViewModel]()
        self.collection = collection
        
        if collection.recipes.count == 0 {
            let empty = EmptyRecipeCellViewModel()
            cellsVM.append(empty)
        } else {
            
            for recipe in collection.recipes {
                let icone = recipe.imageURL
            
                
                let cellVM = FavoriteCellViewModel(name: recipe.name,
                                                 secondName: recipe.ingredientsNeeded,
                                                 image: icone, duration: recipe.duration, numberOfPeople: recipe.numberOfPeople, routingEntry: DetailRoutingEntry(recipe: recipe))
                self.cellsVM.append(cellVM)
            }
            
        

    

        
   
    }
}
}
