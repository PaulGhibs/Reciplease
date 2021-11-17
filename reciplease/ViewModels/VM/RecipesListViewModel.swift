//
//  TableViewModel.swift
//  reciplease
//
//  Created by Paul Ghibeaux on 14/09/2021.
//

import Foundation
// MARK: - RecipeListViewModel

class RecipesListViewModel : ViewModel {
    // No back button
    var shouldDisplayBackButton = false
    var sections: [Section] = []
    var apiService : APIService?
  
    // get users ingredients tiped as a string
    static var choosenIngredient: String {
        get {
            return UserDefaults.standard.string(forKey: Ingredients.ingredients) ?? ""
        }
        set {
            UserDefaults.standard.set(newValue, forKey: Ingredients.ingredients)
        }
       
    }
    // recipe collection empty
    var recipes = RecipeCollection(recipes: [])

    init(apiService: APIService) {
        self.apiService = apiService
    }
    
    // is requesting
    var isLoading: Bool = false {
        didSet {
            self.updateLoadingStatus?()
        }
    }
    var updateLoadingStatus: (()->())?
    
    func loadData(callback: @escaping (Error?) -> ()) {
        self.isLoading = true
        // api service protocol with typed ingredients
        _ = apiService?.requestRecipe(with: RecipesListViewModel.choosenIngredient) { (success, resource) in
            // temps sections for append if success
            var tempSections: [Section] = []
            if success, let resource = resource {
                // parse resource as recipe collection
                self.recipes = resource as! RecipeCollection
                let currentCollectionSection = RecipeViewSection(collection : self.recipes)
                // append temps sections with recipeviewsection collection parsed
                tempSections.append(currentCollectionSection)
                // define tempssections as sections
                self.sections = tempSections
                

            }
            // callback no recipeFound if error
            callback(RecipeError.noRecipeFound)
        }
        
    }
    
   
    
   
    
}
