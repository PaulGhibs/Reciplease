//
//  ExampleRouter.swift
//  reciplease
//
//  Created by Paul Ghibeaux on 21/09/2021.
//

import Foundation

class RecipeRountingEntry : RoutingEntry {
  
    var ingredient: String
    
    init(ingredient : String){
        self.ingredient = ingredient
    }
    
    var viewController: Controller? {
        

        let viewModel = RecipesListViewModel(apiService:RecipeRequest(), choosenIngredient: ingredient)
        
        return RecipesViewController(viewModel: viewModel)
    }
    
    var completionBlock: (() -> Void)?
    var navigationStyle: NavigationStyle {
        return .push
    }
    
}


class DetailRoutingEntry : RoutingEntry {
  
    var recipe : Recipe
    
    
    init(recipe: Recipe){
        self.recipe = recipe
    }
    
    var viewController: Controller? {

        let viewModel = DetailViewModel(recipe: recipe)
        
        return DetailViewController(viewModel: viewModel)
    }
    
    var completionBlock: (() -> Void)?
    var navigationStyle: NavigationStyle {
        return .push
    }
    
}

class NeedimplementRoutingEntry : RoutingEntry {
    var viewController: Controller?
    
    var completionBlock: (() -> Void)? = {
        print("need to implement")
    }
    var navigationStyle: NavigationStyle {
        return .push
    }

    
}


class SuccesLoginRountingEntry : RoutingEntry {
    
    var ingredient: String
    
    init(ingredient : String){
        self.ingredient = ingredient
    }
    
    var viewController: Controller? {
        let viewModel = RecipesListViewModel(apiService: RecipeRequest(), choosenIngredient: ingredient)
        
        return BasicTableViewController(viewModel: viewModel)
    }
    
    var completionBlock: (() -> Void)?
    
    var navigationStyle: NavigationStyle {
        return .push
    }
}
