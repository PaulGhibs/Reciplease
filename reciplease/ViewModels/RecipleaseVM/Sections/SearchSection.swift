//
//  SearchSection.swift
//  reciplease
//
//  Created by Paul Ghibeaux on 16/09/2021.
//

import Foundation


class SearchSection: Section {
    var position: Int
    
    var title: String
    
    var cellsVM: [CellViewModel]

    
    var listIngredients = UserDefaults.standard.object(forKey: "ingredients") as! String
    
    init() {
        self.position = 1
        self.title = ""
        
       
        
        self.cellsVM = [CellViewModel]()
        
        
        let IngredientsSelected = SearchCellViewModel(name: "", title: "Your ingredients: ", clearButton: "Clear", titleHeader: "What's in your fridge ?", IngredientsList: "Lemon,Cheese,Sausages...", buttonTitle: "Add")
      
        
        
        let greenButton = GreenButtonCellViewModel(title: "Search for recipes", routingEntry: RecipeRountingEntry(ingredient: listIngredients))
        
        self.cellsVM.append(IngredientsSelected)
        self.cellsVM.append(greenButton)
             
    }
}
