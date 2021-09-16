//
//  TableViewCell.swift
//  reciplease
//
//  Created by Paul Ghibeaux on 14/09/2021.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var label: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    override func configure(cellViewModel: CellViewModel, from controller: UIViewController) {
        
        guard let tableCVM = cellViewModel as? SearchCellViewModel else {
            return
        }
        
        self.label.text = tableCVM.name
    }
    
}
