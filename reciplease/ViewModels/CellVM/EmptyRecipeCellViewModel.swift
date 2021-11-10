//
//  EmptyRecipeCellViewModel.swift
//  reciplease
//
//  Created by Paul Ghibeaux on 05/11/2021.
//


import Foundation

class EmptyRecipeCellViewModel : TableCellViewModel {
    
    var height: Float {
        return 300
    }
    
   
    var nibName: String? = "EmptyTableViewCell"
    
    lazy var reuseIdentifier: String = String(describing: self)
    
    var indexPath: IndexPath?
    
    var routingEntry: RoutingEntry?

}
