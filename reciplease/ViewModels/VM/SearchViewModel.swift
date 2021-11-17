//
//  SearchViewModel.swift
//  reciplease
//
//  Created by Paul Ghibeaux on 16/09/2021.
//

import Foundation

// MARK: - SearchVM
class SearchViewModel: ViewModel  {
    // No back button
    var shouldDisplayBackButton = false
    var sections: [Section] = []
    func loadData(callback: @escaping (Error?) -> ()) {
        // searchsection as section
        self.sections.append(SearchSection())
        callback(nil)
    }
      
}
