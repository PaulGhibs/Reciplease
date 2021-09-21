//
//  TableViewModel.swift
//  reciplease
//
//  Created by Paul Ghibeaux on 14/09/2021.
//

import Foundation


class RecipeViewModel : ViewModel {
    var sections: [Section] = []

    func loadData(callback: () -> ()) {
        self.sections.append(RecipeViewSection())
        callback()
    }
    
}
