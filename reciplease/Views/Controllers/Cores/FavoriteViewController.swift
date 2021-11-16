//
//  FavoriteViewController.swift
//  reciplease
//
//  Created by Paul Ghibeaux on 16/09/2021.
//

import UIKit

class FavoriteViewController: BasicTableViewController {
    
 
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.backgroundColor = .systemBackground
        let backArrowImage = UIImage(named: "arrow")
        let renderedImage = backArrowImage?.withRenderingMode(.alwaysOriginal)
        // nav back image

        self.navigationController!.navigationBar.barStyle = .default
        self.navigationController!.navigationBar.backIndicatorImage = renderedImage
        self.navigationController!.navigationBar.backIndicatorTransitionMaskImage = renderedImage
        self.navigationController!.navigationBar.backgroundColor = .systemBackground
        // nav title

        self.navigationItem.leftBarButtonItem?.title = "Back"
        let image = UIImage(named: "cook")
        navigationItem.titleView = UIImageView(image: image)

        // load data vm call
        self.viewModel?.loadData { [weak self] _ in
            self?.registerCells()
            self?.tableView.reloadData()
           
        }
    }
    
  
  

}
