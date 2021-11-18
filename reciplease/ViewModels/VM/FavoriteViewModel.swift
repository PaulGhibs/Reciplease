//
//  FavoriteViewModel.swift
//  reciplease
//
//  Created by Paul Ghibeaux on 23/10/2021.
//

import Foundation
import CoreData
// MARK: - FavoriteViewModel

class FavoriteViewModel: ViewModel {
    // no back button
    var shouldDisplayBackButton = false

    var sections: [Section] = []
    // recipe collection empty
    var recipesFav = RecipeCollection(recipes: [])
    // is requesting

    var isLoading: Bool = false {
        didSet {
            self.updateLoadingStatus?()
        }
    }
    var updateLoadingStatus: (()->())?
    func loadData(callback: @escaping (Error?) -> ()) {
        // temps sections & recipe for appending
        var tempSections: [Section] = []
        var tempsRecipe = [Recipe]()
        // for each entry in the entity fetch attributes
        for favorite in Favorite.all {
            let name = favorite.name ?? ""
            let ingredients = favorite.ingredients
            let imageUrl = favorite.imageURL
            let url = favorite.url
            let people = favorite.people 
            let duration = favorite.duration
            let isFavorited = favorite.liked
            
            let newrecipe = Recipe.init(name: name, imageURL: imageUrl, url: url, numberOfPeople: people, duration: duration, ingredientsNeeded: ["\(ingredients ?? "")"], isFavorited : isFavorited)
            // append thems to tempsrecipe
            tempsRecipe.append(newrecipe)
         
        }
        // append recipesfav as tempsrecipecollection
        let tempsRecipeCollection = RecipeCollection.init(recipes: tempsRecipe)
        self.recipesFav = tempsRecipeCollection
        // is requesting true
        self.isLoading = true
        // append tempssection with favoritesection filled with recipe fav
        let currentCollectionSection = FavoriteSection(collection : self.recipesFav)
        tempSections.append(currentCollectionSection)
        self.sections = tempSections
        // raise callback error if no recipe found in entity 
        callback(RecipeError.noRecipeFound)
    }

}


