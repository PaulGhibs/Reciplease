//
//  TabBarController.swift
//  reciplease
//
//  Created by Paul Ghibeaux on 15/09/2021.
//


import UIKit

class TabBarViewController: UITabBarController {
 
    // MARK: - View did load
    override func viewDidLoad() {
        super.viewDidLoad()
        // tab bar appearance
        view.backgroundColor = .systemBackground
        self.tabBar.tintColor = UIColor.darkGray
        self.tabBar.backgroundColor = UIColor.systemBackground
        self.tabBar.barStyle = .default
        tabBar.unselectedItemTintColor = UIColor.lightGray
        let appearance = UITabBarItem.appearance()
        let attributes = [NSAttributedString.Key.font: UIFont(name: "Chalkduster", size: 10)]
        appearance.setTitleTextAttributes(attributes as [NSAttributedString.Key : Any], for: .normal)

        setupVCs()
        
      
    }
    
   
    
    // MARK: - Methods
    func setupVCs() {
            viewControllers = [
                // two controllers the search one and the favorite
                createNavController(for: SearchViewController(viewModel: SearchViewModel()), title: NSLocalizedString("Search", comment: ""), image: UIImage(systemName: "magnifyingglass")!),
                createNavController(for: FavoriteViewController(viewModel: FavoriteViewModel()), title: NSLocalizedString("Favorite", comment: ""), image: UIImage(systemName: "suit.heart")!),
                
            ]
        }
    
    
    fileprivate func createNavController(for rootViewController: UIViewController,
                                                     title: String,
                                                     image: UIImage) -> UIViewController {
           let navController = UINavigationController(rootViewController: rootViewController)
           navController.tabBarItem.title = title
           navController.tabBarItem.image = image
           rootViewController.navigationItem.title = title
           return navController
       }

}


