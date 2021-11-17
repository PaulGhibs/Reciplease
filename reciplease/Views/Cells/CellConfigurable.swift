//
//  CellConfigurable.swift
//  reciplease
//
//  Created by Paul Ghibeaux on 14/09/2021.
//

import Foundation
import UIKit

// protocol cell for datasources in tablesview

@objc protocol CellConfigurable {
    // each cell can be pressed and is configured at cellawakefromnib equivalent

    func configure(cellViewModel: CellViewModel, from controller: UIViewController)
    func cellPressed(cellViewModel: CellViewModel, from controller: UIViewController)
}


extension UITableViewCell: CellConfigurable {
    // each tableviewcell conforms to cellconfigurable 
    func cellPressed(cellViewModel: CellViewModel, from controller: UIViewController) {
        // Do something if needed or override on subclasses
    }
    
    func configure(cellViewModel: CellViewModel, from controller: UIViewController) {
       
    }
    
}


