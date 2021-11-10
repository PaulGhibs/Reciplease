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
    
    /// A detailed favorite recipe
    
    @IBAction func didlikebutton(_ sender: UIButton) {
        guard let recipeName = firstheader.text
             else {
                  return
        }
        
        if !likedButton.isSelected {
            sender.setImage(UIImage(named: "filled"), for: .normal)
            likedButton.isSelected = true
            storeFavorite(named: recipeName)
        } else {
            sender.setImage(UIImage(named: "heart"), for: .normal)

            likedButton.isSelected = false
            deleteFavorite()
        }
        

    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageHeader.layer.cornerRadius = 15
        imageHeader.layer.masksToBounds = true
        imageHeader.contentMode = .scaleAspectFill
        duration.layer.cornerRadius = 15
        duration.layer.masksToBounds = true
        likes.layer.cornerRadius = 15
        likes.layer.masksToBounds = true
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
        self.likes.text = String(tableCVM.numberOfPeople.description) + "👍"
        
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
        favorite.duration = Float(duration.text ?? "") ?? 0
        
        
       
    
        print("recipes saved")

        do { try AppDelegate.viewContext.save() }
        catch { print("unable to store favorite: \(error)") }
    }

    private func deleteFavorite() {
        let favorite = Favorite(context: AppDelegate.viewContext)
        favorite.managedObjectContext?.delete(favorite)
//        self.detailedFavorite.managedObjectContext?.delete(self.detailedFavorite)
        
        do { try AppDelegate.viewContext.save() }
        catch { print("unable to delete favorite: \(error)") }
    }
}

