//
//  EmptyTableViewCell.swift
//  reciplease
//
//  Created by Paul Ghibeaux on 05/11/2021.
//

import UIKit

class EmptyTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    
    @IBOutlet weak var subtitleLabel: UILabel!
    
    @IBOutlet weak var messageImageView: UIImageView!
    
    
    override func configure(cellViewModel : CellViewModel, from controller: UIViewController) {
        
        
        self.titleLabel.text = NSLocalizedString("No recipes Found", comment: "Go back to search view")
        self.subtitleLabel.text = NSLocalizedString("There is maybe something wrong with the ingredients typed ? Try again", comment: "If you saved somes recipes there will be here ")
        self.messageImageView.image = UIImage(named: "nothing")
    }
    

    
}
