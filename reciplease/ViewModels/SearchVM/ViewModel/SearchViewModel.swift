//
//  SearchViewModel.swift
//  reciplease
//
//  Created by Paul Ghibeaux on 16/09/2021.
//

import Foundation

class SearchViewModel: ViewModel {
    var sections: [Section] = []

    func loadData(callback: () -> ()) {
        self.sections.append(SearchSection())
        callback()
    }
    
}
