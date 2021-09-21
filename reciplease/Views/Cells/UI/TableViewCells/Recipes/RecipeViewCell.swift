//
//  RecipeViewCell.swift
//  reciplease
//
//  Created by Paul Ghibeaux on 19/09/2021.
//

import UIKit

class RecipeViewCell: UITableViewCell {

    override func cellPressed(cellViewModel: CellViewModel, from controller: UIViewController) {
        
    
    }
    
    override func configure(cellViewModel : CellViewModel, from controller: UIViewController) {
        guard let tableCVM = cellViewModel as? RecipeCellViewModel else {
            return
        }
    
     

    }
    
    

    
}


