//
//  navigator.swift
//  reciplease
//
//  Created by Paul Ghibeaux on 20/09/2021.
//


import Foundation

protocol Navigator {
    var lastRoutingEntry: RoutingEntry? { get set }
    func visibleViewController() -> Controller?
    func visibleViewController(_ rootViewController: Controller?) -> Controller?
    func route(routingEntry: RoutingEntry,
               fromController: Controller,
               animated: Bool) -> Navigator
}


@objc enum NavigationStyle: Int {
    case push
    case pop
    case modal
    case dismiss
}
