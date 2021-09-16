//
//  SearchCellViewModel.swift
//  reciplease
//
//  Created by Paul Ghibeaux on 16/09/2021.
//

import Foundation

class SearchCellViewModel: TableCellViewModel {
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
