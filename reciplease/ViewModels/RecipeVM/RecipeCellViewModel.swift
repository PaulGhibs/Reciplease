//
//  TableCellViewModel.swift
//  reciplease
//
//  Created by Paul Ghibeaux on 14/09/2021.
//

import Foundation

class RecipeCellViewModel: TableCellViewModel {
    var estimatedHeight: Float {
        return 50
    }
    
    var height: Float {
        return 50
    }
    
    var indexPath: IndexPath?
    var nibName: String? = "TableViewCell"
    lazy var reuseIdentifier: String = String(describing: self)
    var name: String
    
    init(name: String) {
        self.name = name
    }
}
