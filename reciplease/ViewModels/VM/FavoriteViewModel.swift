//
//  FavoriteViewModel.swift
//  reciplease
//
//  Created by Paul Ghibeaux on 23/10/2021.
//


import Foundation
import CoreData

class FavoriteViewModel: ViewModel {
    var shouldDisplayBackButton = true

    var sections: [Section] = []
    
    var recipesFav = RecipeCollection(recipes: [])
    
    var isLoading: Bool = false {
        didSet {
            self.updateLoadingStatus?()
        }
    }
    var updateLoadingStatus: (()->())?
  
    func loadData(callback: @escaping (Error?) -> ()) {
       
        var tempSections: [Section] = []
        
        var tempsRecipe = [Recipe]()
        
        
        
        for favorite in Favorite.all {
        
            let name = favorite.name ?? ""
            let ingredients = favorite.ingredients
            let imageUrl = favorite.imageURL
            let url = favorite.url
            let people = favorite.people 
            let duration = favorite.duration
            let isFavorited = favorite.liked
            
            let newrecipe = Recipe.init(name: name, imageURL: imageUrl, url: url, numberOfPeople: people, duration: duration, ingredientsNeeded: ["\(ingredients ?? "")"], isFavorited : isFavorited)
            tempsRecipe.append(newrecipe)
         
        }
        

        
        let tempsRecipeCollection = RecipeCollection.init(recipes: tempsRecipe)
        self.recipesFav = tempsRecipeCollection
       
        self.isLoading = true

        let currentCollectionSection = FavoriteSection(collection : self.recipesFav)
        tempSections.append(currentCollectionSection)
        
        
        self.sections = tempSections
        callback(RecipeError.deletedFromFavorites)
    }

}



