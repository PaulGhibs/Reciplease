//
//  ExampleRouter.swift
//  reciplease
//
//  Created by Paul Ghibeaux on 21/09/2021.
//

import Foundation

class RecipeRountingEntry : RoutingEntry {
    var viewController: Controller? {
        let viewModel = RecipeViewModel(apiService: RecipeRequest())
        
        return RecipesViewController(viewModel: viewModel)
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
