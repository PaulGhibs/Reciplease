//
//  DetailViewCell.swift
//  reciplease
//
//  Created by Paul Ghibeaux on 21/10/2021.
//

import UIKit
import SDWebImage

class DetailViewCell: UITableViewCell {
    // MARK: - Outlets

    @IBOutlet weak var imageHeader: UIImageView!
    @IBOutlet weak var firstheader: UILabel!
    @IBOutlet weak var detailText: UITextView!
    @IBOutlet weak var duration: UILabel!
    @IBOutlet weak var likes: UILabel!
    @IBOutlet weak var likedButton: UIButton!
    
    
    
    // MARK: - Actions

    @IBAction func didlikebutton(_ sender: UIButton) {
        guard let recipeName = firstheader.text else {
            return
        }
        
        // button select unselected
        if !likedButton.isSelected {
            sender.setImage(UIImage(named: "filled"), for: .normal)
            likedButton.isSelected = true
           
           
            // notification to vm for favorites boolean value
            NotificationCenter.default.addObserver(forName: .newLikedRecipe,
                                                   object: nil,
                                                   queue: .main) { notification in
                // Display image if selected
                guard let url = notification.object as? Bool else {
                    return
                }
                
                sender.isSelected = url
            }
            // store in favorite
            storeFavorite(named: recipeName)
        } else {
            
            // else leave the image like that 
            sender.setImage(UIImage(named: "heart"), for: .normal)
            
            likedButton.isSelected = false
        }
       
      
        
    }
    // MARK: - layouts

    override func layoutSubviews() {
        super.layoutSubviews()
        //image options
        imageHeader.layer.cornerRadius = 15
        imageHeader.layer.masksToBounds = true
        imageHeader.contentMode = .scaleAspectFill
        // duration & likes options
        duration.layer.cornerRadius = 15
        duration.layer.masksToBounds = true
        duration.layer.borderWidth = 1
        duration.layer.borderColor = UIColor.white.cgColor
        likes.layer.cornerRadius = 15
        likes.layer.masksToBounds = true
        likes.layer.borderWidth = 1
        likes.layer.borderColor = UIColor.white.cgColor
        likedButton.setTitle("", for: .normal)
        
    }
    
    // MARK: - Configure

    
    override func configure(cellViewModel : CellViewModel, from controller: UIViewController) {
       
        guard let tableCVM = cellViewModel as? DetailRecipeCellViewModel else {
            return
        }
        // configure outlets from cell vm

        self.firstheader.text = tableCVM.titleHeader
        self.detailText.text = tableCVM.IngredientsList.joined(separator: "\n")
   
        self.imageHeader.sd_setImage(with: tableCVM.imageHeader, completed: nil)
        let formatText = formatMinuteSeconds(Int(tableCVM.duration))
        self.duration.text = String(formatText) + "⏱"
        self.likes.text = String(tableCVM.numberOfPeople) + "👍"
        // Notify vm that we have liked this recipe in favorite
        NotificationCenter.default.post(name: .newLikedRecipe, object: tableCVM.favorites)
    
        if tableCVM.favorites == true {
            self.likedButton.setImage(UIImage(named: "filled"), for: .normal)
        }
    
    }
    
    func formatMinuteSeconds(_ totalSeconds: Int) -> String {
        
            // format minutes and second for nice render in layers
            let minutes = Double(totalSeconds) / 60;
            let seconds = totalSeconds % 60;
            return String(format:"%02d:%02d", minutes, seconds);
    }
    
    
    // MARK: - Store favorite

    // Store favorite recipe data to Favorite view model
    private func storeFavorite(named: String) {
        // call favorite entity
        let favorite = Favorite(context: AppDelegate.viewContext)
        // save labels as favorites attributes
        favorite.name = named
        favorite.imageURL = self.imageHeader.sd_imageURL
        favorite.ingredients = detailText.text
        let duration = (self.duration.text! as NSString).floatValue
        favorite.duration = duration
        let likes = (self.likes.text! as NSString).floatValue
        favorite.people = likes
        favorite.liked = likedButton.isSelected

        print("recipes saved")
        // save context if success or print error if not saved
        do { try AppDelegate.viewContext.save() }
        catch { print("unable to store favorite: \(error)") }
    }

  
}

extension Notification.Name {
    // notification for vm
    static let newLikedRecipe = Notification.Name("new_liked_recipe")
}
