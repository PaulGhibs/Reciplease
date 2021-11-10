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
    var imageHeader : URL?
    var duration : Float
    var numberOfPeople: Float
    var url : URL?
    
    init(name: String, titleHeader: String, imageHeader: URL?, IngredientsList: [String], duration: Float, likes: Float) {
        self.name = name
        self.titleHeader = titleHeader
        self.IngredientsList = IngredientsList
        self.duration = duration
        self.numberOfPeople = likes
        
        self.imageHeader = imageHeader
    }
}
