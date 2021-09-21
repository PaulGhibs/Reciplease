//
//  Routing.swift
//  reciplease
//
//  Created by Paul Ghibeaux on 20/09/2021.
//

import Foundation
import UIKit

class Routing: NSObject, Navigator {
    
    // MARK: - Navigator
    
    var lastNavigationStyle: NavigationStyle?
    
    func visibleViewController() -> Controller? {
        guard let window = UIApplication.shared.delegate?.window else {
            return nil
        }
        return self.visibleViewController(window?.rootViewController)
    }
    
    func visibleViewController(_ rootViewController: Controller?) -> Controller? {
        
        if let rootNavigationController = rootViewController as? UINavigationController {
            let lastViewController: UIViewController? = rootNavigationController.viewControllers.last
            return self.visibleViewController(lastViewController)
        } else if let rootTabBarController = rootViewController as? UITabBarController {
            let selectedViewController: UIViewController? = rootTabBarController.selectedViewController
            return visibleViewController(selectedViewController)
        }
        
        if rootViewController?.presentedController == nil {
            return rootViewController
        } else {
            return self.visibleViewController(rootViewController?.presentedController)
        }
    }
    
    func route(navigationStyle: NavigationStyle, animated: Bool = true) -> Navigator {
        navigationStyle.navigate(animated: animated)
        self.lastNavigationStyle = navigationStyle
        return self
    }
}
