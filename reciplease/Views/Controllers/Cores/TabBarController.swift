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
        let appearance = UITabBarItem.appearance()
        let attributes = [NSAttributedString.Key.font:UIFont(name: "Chalkduster", size: 25)]
        appearance.setTitleTextAttributes(attributes as [NSAttributedString.Key : Any], for: .normal)
        
        let vc2 = SearchViewController()
        let vc3 = FavoriteViewController()
        
        let nav2 = UINavigationController(rootViewController: vc2)
        let nav3 = UINavigationController(rootViewController: vc3)

        nav2.tabBarItem.title = "Search"
        nav3.tabBarItem.title = "Favorite"
        
        nav2.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -15)
        nav3.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -15)


        if let items = self.tabBar.items {

        //Get the height of the tab bar
        let height = self.tabBar.bounds.height

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
        x: xPosition, y: 0, width: 1, height: height+10))
        separator.backgroundColor = UIColor.gray
        tabBar.insertSubview(separator, at: 1)
        }
        }
        }
        
      
        
        
    

   
        setViewControllers([nav2, nav3], animated: false)
   
        
    }
    

}
