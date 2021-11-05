//
//  SearchViewModel.swift
//  reciplease
//
//  Created by Paul Ghibeaux on 16/09/2021.
//

import Foundation

class SearchViewModel: ViewModel  {
    var shouldDisplayBackButton = false
    
  
    var sections: [Section] = []
    var apiService : APIService
    
   
    init(apiService : APIService){
        self.apiService = apiService
    }

    func loadData(callback: @escaping (Error?) -> ()) {
        
        self.sections.append(SearchSection())
        callback(nil)
    }
    
    
  
   
}
