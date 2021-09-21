//
//  Navigation.swift
//  reciplease
//
//  Created by Paul Ghibeaux on 20/09/2021.
//

import Foundation
import Dispatch


protocol NavController {
    func push(controller: Controller, animated: Bool)
    func popController(animated: Bool)
}

protocol NavigationStyle {
    
    func navigate(animated: Bool)
}

struct PushNavigationStyle: NavigationStyle {
    
    let fromNVC: NavController
    var routingEntry: RoutingEntry?
    
    init(fromNVC: NavController,
         routingEntry: RoutingEntry) {
        self.fromNVC = fromNVC
        self.routingEntry = routingEntry
    }
    
    func navigate(animated: Bool) {
        guard let toVC = self.routingEntry?.viewController else { return }
        
        DispatchQueue.main.async {
            self.fromNVC.push(controller: toVC, animated: animated)
        }
        
    }
}

struct PopNavigationStyle: NavigationStyle {
    
    let fromNVC: NavController
    
    init(fromNVC: NavController) {
        self.fromNVC = fromNVC
    }
    
    func navigate(animated: Bool) {
        DispatchQueue.main.async{
            self.fromNVC.popController(animated: animated)
        }
    }
}

struct ModalNavigationStyle: NavigationStyle {
    
    let fromVC: Controller
    var routingEntry: RoutingEntry?
    
    init(fromVC: Controller,
         routingEntry: RoutingEntry) {
        self.fromVC = fromVC
        self.routingEntry = routingEntry
    }
    
    func navigate(animated: Bool) {
        if let toVC = self.routingEntry?.viewController {
            
            DispatchQueue.main.async{
                self.fromVC.present(controller: toVC,
                                    animated: animated) {
                    self.routingEntry?.completionBlock?()
                }
            }
        }
    }
}

struct DismissNavigationStyle: NavigationStyle {
    
    let fromVC: Controller
    var routingEntry: RoutingEntry?
    
    init(fromVC: Controller,
         routingEntry: RoutingEntry) {
        self.fromVC = fromVC
        self.routingEntry = routingEntry
    }
    
    func navigate(animated: Bool) {
        DispatchQueue.main.async{
            self.fromVC.dismissController(animated: animated) {
                self.routingEntry?.completionBlock?()
            }
        }
    }
}


