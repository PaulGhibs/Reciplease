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
    
  
    @IBOutlet weak var detailText: UITextView!
    
    @IBOutlet weak var duration: UILabel!
    @IBOutlet weak var likes: UILabel!
    @IBOutlet weak var likedButton: UIButton!
    
    
    
    
    @IBAction func didlikebutton(_ sender: UIButton) {
        guard let recipeName = firstheader.text else {
            return
        }
        
        if !likedButton.isSelected {
            sender.setImage(UIImage(named: "filled"), for: .normal)
            likedButton.isSelected = true
           
           
            // notification to vm for favorites boolean value
            NotificationCenter.default.addObserver(forName: .newLikedRecipe,
                                                   object: nil,
                                                   queue: .main) { notification in
                // Display image
                guard let url = notification.object as? Bool else {
                    return
                }
                
                sender.isSelected = url
            }
            storeFavorite(named: recipeName)
        } else {
            sender.setImage(UIImage(named: "heart"), for: .normal)

            likedButton.isSelected = false
        }
       
      
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageHeader.layer.cornerRadius = 15
    
        imageHeader.layer.masksToBounds = true
        imageHeader.contentMode = .scaleAspectFill
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
    
    override func configure(cellViewModel : CellViewModel, from controller: UIViewController) {
       
        guard let tableCVM = cellViewModel as? DetailRecipeCellViewModel else {
            return
        }
        
        self.firstheader.text = tableCVM.titleHeader
        self.detailText.text = tableCVM.IngredientsList.joined(separator: "\n")
   
        self.imageHeader.sd_setImage(with: tableCVM.imageHeader, completed: nil)
        let formatText = formatMinuteSeconds(Int(tableCVM.duration))
        self.duration.text = String(formatText) + "⏱"
        self.likes.text = String(tableCVM.numberOfPeople) + "👍"
       
        NotificationCenter.default.post(name: .newLikedRecipe, object: tableCVM.favorites)
    
        if tableCVM.favorites == true {
            self.likedButton.setImage(UIImage(named: "filled"), for: .normal)
        }
    
    }
    
    func formatMinuteSeconds(_ totalSeconds: Int) -> String {
            let minutes = Double(totalSeconds) / 60;
            let seconds = totalSeconds % 60;
            return String(format:"%02d:%02d", minutes, seconds);
    }
    
    
    
    /// Store favorite recipe data to Reciplease data model
    private func storeFavorite(named: String) {
        let favorite = Favorite(context: AppDelegate.viewContext)
        favorite.name = named
        favorite.imageURL = self.imageHeader.sd_imageURL
        favorite.ingredients = detailText.text
        let duration = (self.duration.text! as NSString).floatValue
        favorite.duration = duration
        let likes = (self.likes.text! as NSString).floatValue
        favorite.people = likes
        favorite.liked = likedButton.isSelected
//        let likedButonvalue = self.likedButton.isSelected
//        favorite.favorited = likedButonvalue
        print("recipes saved")

        do { try AppDelegate.viewContext.save() }
        catch { print("unable to store favorite: \(error)") }
    }

  
}

extension Notification.Name {
    static let newLikedRecipe = Notification.Name("new_liked_recipe")
}
