//
//  SearchCellViewModel.swift
//  reciplease
//
//  Created by Paul Ghibeaux on 16/09/2021.
//

import Foundation

class SearchCellViewModel: TableCellViewModel {
    var routingEntry: RoutingEntry?
    
    
 
    
    var height: Float {
        return 150
    }
    
    var indexPath: IndexPath?
    var nibName: String? = "SearchViewCell"
    lazy var reuseIdentifier: String = String(describing: self)
    var name: String
    
    var titleHeader: String
    var IngredientsList: String
    var buttonTitle: String

    
    init(name: String, titleHeader: String, IngredientsList: String, buttonTitle: String) {
        self.name = name
        self.titleHeader = titleHeader
        self.IngredientsList = IngredientsList
        self.buttonTitle = buttonTitle
    }
}
