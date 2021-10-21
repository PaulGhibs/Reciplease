//
//  IngredientsSelectedCell.swift
//  reciplease
//
//  Created by Paul Ghibeaux on 17/09/2021.
//

import UIKit

class IngredientsSelectedCell: UITableViewCell,  UITextViewDelegate {

    @IBOutlet weak var YourIngredients: UILabel!
    
    @IBOutlet weak var clearButton: UIButton!
        
    @IBOutlet weak var titleHeader: UILabel!
    
    @IBOutlet weak var ingredients: UITextField!
    @IBOutlet weak var addButton: UIButton!
    
    @IBOutlet weak var ingredientsLists: UITextView!
    
    //created a string variable
  
    var tempsIngredients = [String]()


    @IBAction func clearAction(_ sender: UIButton) {
        let clearAlert = UIAlertController(title: "Clear", message: "Do you want to remove all the ingredients ?", preferredStyle: .alert)
        clearAlert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { action in
            self.tempsIngredients.removeAll()
            self.ingredientsLists.text = ""
        }))
        clearAlert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
        
    }
    
    
    @IBAction func addIngredients(_ sender: UIButton) {
        if ingredients.text != "" {
            tempsIngredients.append(ingredients.text!)
            ingredientsLists.text = "- " + tempsIngredients.joined(separator: "\n- ")
            ingredients.text = ""
            
            // to do add notification osberver for updating choosen ingredients
//            self.resultchoosenIngredients = tempsIngredients
            
        } else {
//            alert(title: "Erreur !", message: "Veuillez ajouter un ingrédient")
        }
    }
    
    override func configure(cellViewModel : CellViewModel, from controller: UIViewController) {
        guard let tableCVM = cellViewModel as? ResultCellViewModel else {
            return
        }
        titleHeader.text = tableCVM.titleHeader
        ingredients.placeholder = tableCVM.IngredientsList
        addButton.setTitle(tableCVM.buttonTitle, for: .normal)
        addButton.layer.cornerRadius = 2
        YourIngredients.text = tableCVM.title
        ingredientsLists.delegate = self
        clearButton.setTitle(tableCVM.clearbutton, for: .normal)
  
    }
    
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()

        return true
    }

    
    
    
}
