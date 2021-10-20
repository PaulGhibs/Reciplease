//
//  TableViewModel.swift
//  reciplease
//
//  Created by Paul Ghibeaux on 14/09/2021.
//

import Foundation


class RecipeViewModel : ViewModel {
    var sections: [Section] = []
    var apiService : APIService?
    
    
    var recipes = RecipeCollection(recipes: [])

    init(apiService: APIService) {
        self.apiService = apiService
    }

    
    var ingredientsUsed: String = "chicken"

    func loadData(callback: @escaping (Error?) -> ()) {

        _ = apiService?.requestRecipe(with: "\(ingredientsUsed)") { (success, resource) in
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
