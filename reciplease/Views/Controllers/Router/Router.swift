//
//  Router.swift
//  reciplease
//
//  Created by Paul Ghibeaux on 20/09/2021.
//


import Foundation

@objc protocol RoutingEntry {
    
    var navigationStyle: NavigationStyle { get }
    var viewController: Controller? { get }
    var completionBlock: (() -> Void)? { get set }

}

@objc protocol Controller {
    
    var presentedController: Controller? { get }
    var navController: NavController? { get }

    func present(controller: Controller,
                 animated: Bool,
                 completion: @escaping () -> ())
    func dismissController(animated: Bool, completion: @escaping () -> ())
    
}
