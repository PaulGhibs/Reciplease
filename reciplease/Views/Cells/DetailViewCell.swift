//
//  DetailViewCell.swift
//  reciplease
//
//  Created by Paul Ghibeaux on 21/10/2021.
//

import UIKit
import SDWebImage

class DetailViewCell: UITableViewCell {

    @IBOutlet weak var imageHeader: UIImageView!
    
    
    @IBOutlet weak var firstheader: UILabel!
    
    @IBOutlet weak var DetailText: UILabel!
    
    
    
    override func configure(cellViewModel : CellViewModel, from controller: UIViewController) {
       
        guard let tableCVM = cellViewModel as? DetailRecipeCellViewModel else {
            return
        }
        
        self.firstheader.text = tableCVM.titleHeader
        for text in tableCVM.IngredientsList {
            self.DetailText.text = text
        }

        self.imageHeader.sd_setImage(with: tableCVM.imageHeader, completed: nil)

        

    
}
    
}
