//
//  IngredientsSelectedCell.swift
//  reciplease
//
//  Created by Paul Ghibeaux on 17/09/2021.
//

import UIKit

class IngredientsSelectedCell: UITableViewCell {

    @IBOutlet weak var YourIngredients: UILabel!
    
    @IBOutlet weak var clearButton: UIButton!
    
    @IBOutlet var ChoosenIngredients: [UILabel]!
    
    
    override func cellPressed(cellViewModel: CellViewModel, from controller: UIViewController) {
    
    }
   
    
    
    
    override func configure(cellViewModel : CellViewModel, from controller: UIViewController) {
        guard let tableCVM = cellViewModel as? ResultCellViewModel else {
            return
        }
    
        YourIngredients.text = tableCVM.title
        clearButton.setTitle(tableCVM.clearbutton, for: .normal)
        
        
    }
    
  

    


    
}
