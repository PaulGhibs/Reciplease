//
//  ResultCellViewModel.swift
//  reciplease
//
//  Created by Paul Ghibeaux on 17/09/2021.
//

import Foundation

class ResultCellViewModel: TableCellViewModel {
    var routingEntry: RoutingEntry?
    
    
    var height: Float {
        return 520
    }
    
    var indexPath: IndexPath?
    var nibName: String? = "IngredientsSelectedCell"
    lazy var reuseIdentifier: String = String(describing: self)
    var name: String
    
    var titleHeader: String
    var IngredientsList: String
    var buttonTitle: String

    
    var title: String
    var clearbutton: String
    var choosenIngredients: [String]

  
    init(name: String, title: String, clearButton: String, choosenIngredients: [String], titleHeader: String, IngredientsList: String, buttonTitle: String) {
        self.name = name
        self.title = title
        self.clearbutton = clearButton
        self.choosenIngredients = choosenIngredients
        self.titleHeader = titleHeader
        self.IngredientsList = IngredientsList
        self.buttonTitle = buttonTitle

    }
}
