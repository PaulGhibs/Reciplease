//
//  TabBarController.swift
//  reciplease
//
//  Created by Paul Ghibeaux on 15/09/2021.
//


import UIKit

class TabBarViewController: UITabBarController {
 
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        self.tabBar.tintColor = UIColor.darkGray
        self.tabBar.backgroundColor = UIColor.systemBackground
        self.tabBar.barStyle = .default
        tabBar.unselectedItemTintColor = UIColor.lightGray
        let appearance = UITabBarItem.appearance()
        let attributes = [NSAttributedString.Key.font: UIFont(name: "Chalkduster", size: 10)]
        appearance.setTitleTextAttributes(attributes as [NSAttributedString.Key : Any], for: .normal)

        setupVCs()
   
        if let items = self.tabBar.items {
        //Get the height of the tab bar
        let height = self.tabBar.bounds.height+2

        //Calculate the size of the items

        let numItems = CGFloat(items.count)
        let itemSize = CGSize(
        width: tabBar.frame.width / numItems,
        height: tabBar.frame.height)

        for (index, _) in items.enumerated() {

        //We don't want a separator on the left of the first item.

        if index > 0 {

        //Xposition of the item

        let xPosition = itemSize.width * CGFloat(index)

        /* Create UI view at the Xposition,
        with a width of 0.5 and height equal
        to the tab bar height, and give the
        view a background color
        */
        let separator = UIView(frame: CGRect(
        x: xPosition, y: 0, width: 0.5, height: height+15))
        separator.backgroundColor = UIColor.darkGray
        tabBar.insertSubview(separator, at: 1)
        }
        }
        }
    }
    
   
    
    
    func setupVCs() {
            viewControllers = [
                createNavController(for: SearchViewController(viewModel: SearchViewModel(apiService: RecipeRequest())), title: NSLocalizedString("Search", comment: ""), image: UIImage(systemName: "magnifyingglass")!),
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


