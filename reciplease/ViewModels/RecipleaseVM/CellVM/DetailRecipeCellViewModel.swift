//
//  DetailRecipeCellViewModel.swift
//  reciplease
//
//  Created by Paul Ghibeaux on 20/10/2021.
//

import Foundation

class DetailRecipeCellViewModel: TableCellViewModel {
    var routingEntry: RoutingEntry?
    
    
    var height: Float {
        return 550
    }
    
    var indexPath: IndexPath?
    var nibName: String? = "DetailViewCell"
    lazy var reuseIdentifier: String = String(describing: self)
    var name: String
    
    var titleHeader: String
    var IngredientsList: [String]
    var buttonLike: Bool
    var imageHeader : URL?
    
    init(name: String, titleHeader: String, imageHeader: URL?, IngredientsList: [String], buttonLike: Bool) {
        self.name = name
        self.titleHeader = titleHeader
        self.IngredientsList = IngredientsList
        self.buttonLike = buttonLike
        
        self.imageHeader = imageHeader
    }
}
