//
//  RecipeViewCell.swift
//  reciplease
//
//  Created by Paul Ghibeaux on 19/09/2021.
//

import UIKit
import SDWebImage

class FavoriteViewCell: UITableViewCell {

    @IBOutlet weak var firstHeader: UILabel!
    
    @IBOutlet weak var secondText: UILabel!
    
    @IBOutlet weak var imageBackground: UIImageView!
    
    @IBOutlet weak var duration: UILabel!
    
    @IBOutlet weak var numberOfPeople: UILabel!
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        firstHeader.layer.shadowRadius = 5.0 //set shadow radius to your desired value.
        firstHeader.layer.shadowOpacity = 1.0 //Choose an opacity. Make sure it's visible (default is 0.0)
        //Other options
        firstHeader.layer.shadowOffset = CGSize(width: 10, height: 10)
        firstHeader.layer.shadowColor = UIColor.black.cgColor
        firstHeader.layer.masksToBounds = false

        imageBackground.contentMode = .scaleAspectFill
        imageBackground.clipsToBounds = true
        imageBackground.layer.cornerRadius = 10
    
        duration.layer.cornerRadius = 12
        self.duration.contentMode = .scaleAspectFit
        self.duration.layer.borderColor = UIColor.white.cgColor
        duration.layer.masksToBounds = true
        numberOfPeople.layer.cornerRadius = 12
        numberOfPeople.layer.masksToBounds = true
    }
    
    
    override func configure(cellViewModel : CellViewModel, from controller: UIViewController) {
        guard let tableCVM = cellViewModel as? FavoriteCellViewModel else {
            return
        }
        
        
        self.firstHeader.text = tableCVM.name
       
        for text in tableCVM.secondName {
            self.secondText.text = text
        }
        let formatText = formatMinuteSeconds(Int(tableCVM.duration))
        self.duration.text = String(formatText) + "⏱"
        self.imageBackground.sd_setImage(with: tableCVM.image, completed: nil)
         self.numberOfPeople.text = String(tableCVM.numberOfPeople.description) + "👍"
        self.numberOfPeople.layer.borderColor = UIColor.white.cgColor

    }
    
   
    func formatMinuteSeconds(_ totalSeconds: Int) -> String {

            let minutes = Double(totalSeconds) / 60;
            let seconds = totalSeconds % 60;

            return String(format:"%02d:%02d", minutes, seconds);
    }
    
    
    

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
    
    

    
}


