//
//  RecipeViewCell.swift
//  reciplease
//
//  Created by Paul Ghibeaux on 19/09/2021.
//

import UIKit
import SDWebImage

class RecipeViewCell: UITableViewCell {

    @IBOutlet weak var firstHeader: UILabel!
    
    @IBOutlet weak var secondText: UILabel!
    
    @IBOutlet weak var imageBackground: UIImageView!
    
    @IBOutlet weak var duration: UILabel!
    
    @IBOutlet weak var numberOfPeople: UILabel!
    
    
    
    override func configure(cellViewModel : CellViewModel, from controller: UIViewController) {
        guard let tableCVM = cellViewModel as? RecipeCellViewModel else {
            return
        }
        
        
        self.firstHeader.text = tableCVM.name
        firstHeader.layer.shadowRadius = 5.0 //set shadow radius to your desired value.
        firstHeader.layer.shadowOpacity = 1.0 //Choose an opacity. Make sure it's visible (default is 0.0)
        //Other options
        firstHeader.layer.shadowOffset = CGSize(width: 10, height: 10)
        firstHeader.layer.shadowColor = UIColor.black.cgColor
        firstHeader.layer.masksToBounds = false

        for text in tableCVM.secondName {
            self.secondText.text = text
        }

        let formatText = formatMinuteSeconds(Int(tableCVM.duration))
        self.duration.text = String(formatText) + "⏱"
        self.duration.contentMode = .scaleAspectFit
        self.duration.layer.borderColor = UIColor.white.cgColor
        self.imageBackground.sd_setImage(with: tableCVM.image, completed: nil)
        imageBackground.contentMode = .scaleAspectFill
        imageBackground.clipsToBounds = true
        imageBackground.layer.cornerRadius = 10
        let blurEffect = UIBlurEffect(style: .systemMaterial)
        let visualEffectView = UIVisualEffectView(effect: blurEffect)
        visualEffectView.frame = contentView.frame.integral
        visualEffectView.contentMode = .scaleAspectFill
        visualEffectView.alpha = 0.1
        self.imageBackground.addSubview(visualEffectView)
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


