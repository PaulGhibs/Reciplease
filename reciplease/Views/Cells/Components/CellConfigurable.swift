//
//  CellConfigurable.swift
//  reciplease
//
//  Created by Paul Ghibeaux on 14/09/2021.
//

import Foundation
import UIKit


@objc protocol CellConfigurable {
    func configure(cellViewModel: CellViewModel, from controller: UIViewController)
    func cellPressed(cellViewModel: CellViewModel, from controller: UIViewController)
}


extension UITableViewCell: CellConfigurable {
    
    func cellPressed(cellViewModel: CellViewModel, from controller: UIViewController) {
        // Do something if needed or override on subclasses
    }
    
    func configure(cellViewModel: CellViewModel, from controller: UIViewController) {
        guard let tableCVM = cellViewModel as? SearchCellViewModel else {
            return
        }
        
        self.textLabel?.text = tableCVM.name
    }
    
}

