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
    
    
    var recipes = RecipeCollection(recipes: [])
    
    
    var ingredient: String
    
    
    init(apiService: APIService, ingredient : String) {
        self.apiService = apiService
        self.ingredient = ingredient
        
    }
    

    // try notification post here
  
    
    func loadData(callback: @escaping (Error?) -> ()) {
  
        _ = apiService?.requestRecipe(with: ingredient) { (success, resource) in
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
    
    private func checkRecipeCount(_ recipes: RecipeCollection) {
        if self.recipes.recipes.count == 0 {
          }
      }
    
    
    
}
