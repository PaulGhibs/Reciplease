//
//  TableViewModel.swift
//  reciplease
//
//  Created by Paul Ghibeaux on 14/09/2021.
//

import Foundation

class RecipesListViewModel : ViewModel {
    var shouldDisplayBackButton = false
    var sections: [Section] = []
    var apiService : APIService?
  
    // try notification post here
    static var choosenIngredient: String {
        get {
            return UserDefaults.standard.string(forKey: Ingredients.ingredients) ?? ""
        }
        set {
            UserDefaults.standard.set(newValue, forKey: Ingredients.ingredients)
        }
       
    }
    
    var recipes = RecipeCollection(recipes: [])

    init(apiService: APIService) {
        self.apiService = apiService
    }
    
  
    var isLoading: Bool = false {
        didSet {
            self.updateLoadingStatus?()
        }
    }
    var updateLoadingStatus: (()->())?
    
    func loadData(callback: @escaping (Error?) -> ()) {
        self.isLoading = true

        _ = apiService?.requestRecipe(with: RecipesListViewModel.choosenIngredient) { (success, resource) in
            var tempSections: [Section] = []
            if success, let resource = resource {
                
                self.recipes = resource as! RecipeCollection
                let currentCollectionSection = RecipeViewSection(collection : self.recipes)
                tempSections.append(currentCollectionSection)
                self.sections = tempSections
                callback(RecipeError.noRecipeFound)

            }
        }
        
    }
    
   
    
   
    
}
