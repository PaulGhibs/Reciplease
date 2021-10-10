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
    
    
    var recipeCollection: RecipeCollection
    
    init(apiService: APIService, recipeCollection : RecipeCollection) {
        self.apiService = apiService
        self.recipeCollection = recipeCollection
    }

    
    var ingredientsUsed: String = "chicken"
    
    func loadData(callback: @escaping (Error?) -> ()) {
        
        _ = apiService?.requestRecipe(with: "\(ingredientsUsed)") { (success, resource) in
            
            if success, let resource = resource {
                self.recipeCollection = resource as! RecipeCollection
       
                print(self.recipeCollection)
                self.sections.append(RecipeViewSection(recipes: self.recipeCollection))
                
            } else {
                
            }
        }
        
    }
    
    
    
    private func checkRecipeCount(_ recipes: RecipeCollection) {
        if self.recipeCollection.recipes.count == 0 {
            print(self.recipeCollection.recipes.count)
        }
    }
    
}
