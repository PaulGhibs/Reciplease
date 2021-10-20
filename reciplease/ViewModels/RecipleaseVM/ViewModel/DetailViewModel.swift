//
//  DetailViewModel.swift
//  reciplease
//
//  Created by Paul Ghibeaux on 20/10/2021.
//

import Foundation


class DetailViewModel: ViewModel {
    var sections: [Section] = []
    
    var recipe : Recipe

    init(recipe: Recipe) {
        self.recipe = recipe
    }
    func loadData(callback: @escaping (Error?) -> ()) {
        self.sections.append(DetailViewSection(recipe: recipe))
        callback(nil)
    }
    
}
