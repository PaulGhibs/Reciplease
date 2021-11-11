//
//  RecipesViewController.swift
//  reciplease
//
//  Created by Paul Ghibeaux on 17/09/2021.
//

import UIKit

class RecipesViewController: BasicTableViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.backgroundColor = .systemBackground
        let backArrowImage = UIImage(named: "arrow")
        let renderedImage = backArrowImage?.withRenderingMode(.alwaysOriginal)
        
        self.navigationController!.navigationBar.barStyle = .default
        self.navigationController!.navigationBar.backIndicatorImage = renderedImage
        self.navigationController!.navigationBar.backIndicatorTransitionMaskImage = renderedImage
        self.navigationController!.navigationBar.backgroundColor = .systemBackground
        self.navigationController?.navigationBar.backItem?.title = " "

        
        let image = UIImage(named: "cook")
        navigationItem.titleView = UIImageView(image: image)

        self.viewModel?.loadData { [weak self] _ in
            self?.registerCells()
            self?.tableView.reloadData()

        }
    }
    

}
