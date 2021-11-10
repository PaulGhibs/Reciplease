//
//  AlertRoutingEntry.swift
//  reciplease
//
//  Created by Paul Ghibeaux on 10/11/2021.
//

import Foundation
import UIKit

class AlertRoutingEntry : RoutingEntry {
    
    var message : String
    var title : String
    
    init(message : String, title : String){
        self.message = message
        self.title = title
    }

    var viewController: Controller? {
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: NSLocalizedString("OK", comment: "OK"), style: .cancel, handler: nil)
        alertVC.addAction(action)
        return alertVC
    }
    
    var completionBlock: (() -> Void)?
    
    var navigationStyle: NavigationStyle {
        return .modal
    }
}

