//
//  SearchViewCell.swift
//  reciplease
//
//  Created by Paul Ghibeaux on 16/09/2021.
//

import UIKit

class SearchViewCell: UITableViewCell {

   
    
    
    @IBOutlet weak var titleHeader: UILabel!
    
    @IBOutlet weak var ingredients: UITextField!
    @IBOutlet weak var addbutton: UIButton!
    
    
 
    
    override func configure(cellViewModel : CellViewModel, from controller: UIViewController) {
        guard let tableCVM = cellViewModel as? SearchCellViewModel else {
            return
        }
    
        titleHeader.text = tableCVM.titleHeader
        
        ingredients.placeholder = tableCVM.IngredientsList
        addbutton.setTitle(tableCVM.buttonTitle, for: .normal)
    
        

    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.layer.cornerRadius = 15
       
        addbutton.layer.cornerRadius = 20
        
    }
    
    

    
}
