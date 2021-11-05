//
//  FavoriteViewModel.swift
//  reciplease
//
//  Created by Paul Ghibeaux on 23/10/2021.
//


import Foundation

class FavoriteViewModel: ViewModel {
    var shouldDisplayBackButton = true
    
    
    
    var sections: [Section] = []
    var apiService : APIService?
    
    
    var recipes = RecipeCollection(recipes: [])
    
 
    
    
    init(apiService: APIService) {
        self.apiService = apiService
        
        
    }
    

    // try notification post here
  

    func loadData(callback: @escaping (Error?) -> ()) {
  
   
        _ = apiService?.requestRecipe(with: "") { (success, resource) in
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

