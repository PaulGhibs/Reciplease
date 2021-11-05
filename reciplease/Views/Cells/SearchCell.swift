//
//  IngredientsSelectedCell.swift
//  reciplease
//
//  Created by Paul Ghibeaux on 17/09/2021.
//

import UIKit
import Foundation


class SearchCell: UITableViewCell, UITextViewDelegate {
    
    @IBOutlet weak var homeImage: UIImageView!
    @IBOutlet weak var YourIngredients: UILabel!
    @IBOutlet weak var clearButton: UIButton!
    @IBOutlet weak var titleHeader: UILabel!
    @IBOutlet weak var ingredients: UITextField!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var ingredientsLists: UITextView!{
        didSet {
            ingredientsLists.layer.cornerRadius = 10
        }
    }
    
    //created a string variable
  
    var tempsIngredients = [String]()
  
    
   
    @IBAction func clearAction(_ sender: UIButton) {
        self.tempsIngredients.removeAll()
        self.ingredientsLists.text = ""
        
        let domain = Bundle.main.bundleIdentifier!
        UserDefaults.standard.removePersistentDomain(forName: domain)
        UserDefaults.standard.synchronize()
        print(Array(UserDefaults.standard.dictionaryRepresentation().keys).count)
        }
    
    
    @IBAction func addIngredients(_ sender: UIButton) {
        if ingredients.text != "" {
            tempsIngredients.append(ingredients.text!)
            ingredientsLists.text = "-" + tempsIngredients.joined(separator: "\n-")
            ingredients.text = ""
            // Notify viewModel that we have something in tempsIngredients

        }
        
        RecipesListViewModel.choosenIngredient = tempsIngredients.joined(separator: "\n-")
       
    }
    
  
    
    override func configure(cellViewModel : CellViewModel, from controller: UIViewController) {
        guard let tableCVM = cellViewModel as? SearchCellViewModel else {
            return
        }
        titleHeader.text = tableCVM.titleHeader
        ingredients.placeholder = tableCVM.IngredientsList
        addButton.setTitle(tableCVM.buttonTitle, for: .normal)
        addButton.layer.cornerRadius = 2
        YourIngredients.text = tableCVM.title
        ingredientsLists.delegate = self
        clearButton.setTitle(tableCVM.clearbutton, for: .normal)
        homeImage.layer.cornerRadius = 20
        let domain = Bundle.main.bundleIdentifier!
        UserDefaults.standard.removePersistentDomain(forName: domain)
        UserDefaults.standard.synchronize()
        print(Array(UserDefaults.standard.dictionaryRepresentation().keys).count)

    }
    

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
    
    private func textFieldDidBeginEditing(_ textField: UITextField) {
        ingredients.isEnabled = false
    }
    
   
}



