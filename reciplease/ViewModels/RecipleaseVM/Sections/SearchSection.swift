//
//  SearchSection.swift
//  reciplease
//
//  Created by Paul Ghibeaux on 16/09/2021.
//

import Foundation
import Combine



class SearchSection: Section , ObservableObject {
    
    
    
    var position: Int
    
    var title: String
    
    var cellsVM: [CellViewModel]
    
    let objectWillChange = CurrentValueSubject<String, Never>("")

    @Published private (set) var ingredients: [String] = []
    var choosenIngredient : String?
    
    init() {
        self.position = 1
        self.title = ""
   
        self.cellsVM = [CellViewModel]()
        
        
        
        let IngredientsSelected = SearchCellViewModel(name: "", title: "Your ingredients: ", clearButton: "Clear", titleHeader: "What's in your fridge ?", IngredientsList: "Lemon,Cheese,Sausages...", buttonTitle: "Add")
     
        self.cellsVM.append(IngredientsSelected)
        fetch()

    }
    
    
    func fetch() {
           // fetch posts
        
        let greenButton = GreenButtonCellViewModel(title: "Search for recipes", routingEntry: RecipeRountingEntry(ingredient: (ingredients.joined(separator: ""))))
        self.cellsVM.append(greenButton)
           // assign new data to the posts variable
       }
}
