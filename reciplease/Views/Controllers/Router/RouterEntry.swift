//
//  ExampleRouter.swift
//  reciplease
//
//  Created by Paul Ghibeaux on 21/09/2021.
//

import Foundation

class RecipeRountingEntry : RoutingEntry {
  
    
    var viewController: Controller? {
        

        let viewModel = RecipesListViewModel(apiService:RecipeRequest())
        
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


class WebRoutingEntry : RoutingEntry {
    
    var url : URL?
    
    var viewController: Controller? {
        let viewModel = WebViewModel(url: self.url!)
        return WebViewController(viewModel: viewModel)
    }
    
    var completionBlock: (() -> Void)?
    
    var navigationStyle: NavigationStyle {
        return .push
    }
    
    init(url : URL?){
        self.url = url 
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


