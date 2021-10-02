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
    
    
    var recipes: [Recipe] = []
    
    init(apiService: APIService) {
        self.apiService = apiService
    }

    
    var ingredientsUsed: String = ""
    
    func loadData(callback: @escaping (Error?) -> ()) {
        
        _ = apiService?.getRecipe(ingredient: "\(ingredientsUsed)") { result in
           
           switch result {
           case .success(let recipeResponse):
               self.recipes = recipeResponse.recipes
               print(self.recipes)
               
                   
                   
               self.sections.append(RecipeViewSection())
               
               
          
               
           case .failure(let error): print(error)
               callback(error)
           case .none:
                callback(nil)
           }
           
            
       }
    }
    
}
