//
//  DetailViewModel.swift
//  reciplease
//
//  Created by Paul Ghibeaux on 20/10/2021.
//

import Foundation

// MARK: - RecipeListViewModel

class DetailViewModel: ViewModel {
    
    // Back button visible
    var shouldDisplayBackButton = true
    
    var sections: [Section] = []
    
    // recipe init
    var recipe : Recipe
    init(recipe: Recipe) {
        self.recipe = recipe
    }
    func loadData(callback: @escaping (Error?) -> ()) {
        // detailviewsection
        self.sections.append(DetailViewSection(recipe: recipe))
        callback(nil)
    }
    
}

