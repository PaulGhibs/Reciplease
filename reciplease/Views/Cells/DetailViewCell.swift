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
    
    @IBOutlet weak var detailText: UILabel!
    
    var recipe : Recipe?
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageHeader.layer.cornerRadius = 20
        imageHeader.layer.masksToBounds = true
        imageHeader.contentMode = .scaleAspectFill
        
    }
    
    override func configure(cellViewModel : CellViewModel, from controller: UIViewController) {
       
        guard let tableCVM = cellViewModel as? DetailRecipeCellViewModel else {
            return
        }
        
        self.firstheader.text = tableCVM.titleHeader
        self.detailText.text = tableCVM.IngredientsList.joined(separator: "\n")
   
        self.imageHeader.sd_setImage(with: tableCVM.imageHeader, completed: nil)

    }
    
}
