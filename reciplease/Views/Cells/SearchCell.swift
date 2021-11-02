//
//  IngredientsSelectedCell.swift
//  reciplease
//
//  Created by Paul Ghibeaux on 17/09/2021.
//

import UIKit
import Foundation
import Combine


class SearchCell: UITableViewCell {
    
    @IBOutlet weak var YourIngredients: UILabel!
    @IBOutlet weak var clearButton: UIButton!
    @IBOutlet weak var titleHeader: UILabel!
    @IBOutlet weak var ingredients: UITextField!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var ingredientsLists: UITextView!{
        didSet {
            ingredientsLists.layer.borderColor = UIColor.lightGray.cgColor
            ingredientsLists.layer.cornerRadius = 10
            ingredientsLists.layer.borderWidth = 1.0
        }
    }
    
    //created a string variable
    
    
   
    
    var tempsIngredients = [String]() 
    
    var viewmodel = SearchSection()
    private var cancellables: Set<AnyCancellable> = []

    private var cancelBag = Set<AnyCancellable>()
    @IBAction func clearAction(_ sender: UIButton) {
        self.tempsIngredients.removeAll()
        self.ingredientsLists.text = ""

    }
    
    
    @IBAction func addIngredients(_ sender: UIButton) {
        if ingredients.text != "" {
            tempsIngredients.append(ingredients.text!)
            ingredientsLists.text = "-" + tempsIngredients.joined(separator: "\n-")
            ingredients.text = ""
            // Notify viewModel that we have something in tempsIngredients
        }
        
        viewmodel.fetch()
        self.tempsIngredients = viewmodel.ingredients
       
//        for ingredient in tempsIngredients {
//            viewmodel.choosenIngredients = ingredient
//
//        }
////
//        let publisher = ingredientsLists.text.publisher
//        _ = publisher.sink { value in
//                self.viewmodel.ingredientsSelect = value
//        }

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
        clearButton.setTitle(tableCVM.clearbutton, for: .normal)
   
    }
    
  
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
    
    private func bindViewModel() {
        viewmodel.$ingredients
            .receive(on: RunLoop.main)
            .sink { _ in
                _ = self.tempsIngredients
                
            }
            .store(in: &cancellables)
       }
    
}




