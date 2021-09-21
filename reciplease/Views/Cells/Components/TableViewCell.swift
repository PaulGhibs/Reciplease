//
//  TableViewCell.swift
//  BassGears
//
//  Created by Florian Basso on 23/08/2021.
//

import UIKit

// Example to configure a cell from a xib

class TableViewCell: UITableViewCell {

    @IBOutlet weak var label: UILabel!
 
    override func configure(cellViewModel: CellViewModel, from controller: UIViewController) {
        
        guard let tableCVM = cellViewModel as? SearchCellViewModel else {
            return
        }
        
        self.label.text = tableCVM.name
    }
    
    override func cellPressed(cellViewModel: CellViewModel, from controller: UIViewController) {
        // Do something if needed
       
    }        
    
}
