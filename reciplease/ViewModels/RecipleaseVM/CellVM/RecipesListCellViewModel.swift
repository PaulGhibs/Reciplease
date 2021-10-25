//
//  TableCellViewModel.swift
//  reciplease
//
//  Created by Paul Ghibeaux on 14/09/2021.
//

import Foundation

class RecipesListCellViewModel: TableCellViewModel {
    var routingEntry: RoutingEntry?
 
    var height: Float {
        return 185
    }
    
    
    var indexPath: IndexPath?
    var nibName: String? = "RecipeViewCell"
    lazy var reuseIdentifier: String = String(describing: self)
 
    /// Recipes instance
  
    var name : String
   
    var secondName: [String]
    var image: URL?
    var duration : Float
    var numberOfPeople: Float
    
  
    
    init(name: String, secondName: [String], image: URL?, duration: Float, numberOfPeople: Float,  routingEntry : RoutingEntry) {
        self.name = name
        self.secondName = secondName
        self.image = image
        self.duration = duration
        self.numberOfPeople = numberOfPeople
        self.routingEntry = routingEntry
    }
    
    
    
    
}
