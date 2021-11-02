//
//  TableViewModel.swift
//  reciplease
//
//  Created by Paul Ghibeaux on 14/09/2021.
//

import Foundation

class RecipesListViewModel : ViewModel {
    var sections: [Section] = []
    var apiService : APIService?
  
    // try notification post here
    @Published var choosenIngredients: String


    var recipes = RecipeCollection(recipes: [])

    init(apiService: APIService, choosenIngredient: String) {
        self.apiService = apiService
        self.choosenIngredients = choosenIngredient
    }
    
    
  
    func loadData(callback: @escaping (Error?) -> ()) {
        _ = apiService?.requestRecipe(with: choosenIngredients) { (success, resource) in
            var tempSections: [Section] = []
            if success, let resource = resource {
                self.recipes = resource as! RecipeCollection
                let currentCollectionSection = RecipeViewSection(collection : self.recipes)
                tempSections.append(currentCollectionSection)
                self.sections = tempSections
                callback(nil)

            }
        }
     
    }
    
    
}
