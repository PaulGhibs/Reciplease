//
//  GreenButton.swift
//  reciplease
//
//  Created by Paul Ghibeaux on 15/09/2021.
//

import UIKit

let cellIdentifier = "GreenButton"

class GreenButton: UITableViewCell {
    
    @IBOutlet weak var greenButton: UIButton!
    
    var tempsIngredients = [String]()

    override func cellPressed(cellViewModel: CellViewModel, from controller: UIViewController) {
        
        guard let routingEntry = cellViewModel.routingEntry,
              let navController = controller.navigationController else {
                  return
              }
        
        let newRouting = Routing()
        
        _ = newRouting
            .route(routingEntry: routingEntry,
                   fromController: navController,
                   animated: true)
        
        
    }
    
    override func configure(cellViewModel : CellViewModel, from controller: UIViewController) {
        
        guard let tableCVM = cellViewModel as? GreenButtonCellViewModel else {
            return
        }
        
        
        greenButton.setTitle(tableCVM.title, for: .normal)
        greenButton.layer.cornerRadius = 20
      
        
        
    }
    
    
}
