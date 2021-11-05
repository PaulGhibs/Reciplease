//
//  DetailViewController.swift
//  reciplease
//
//  Created by Paul Ghibeaux on 20/10/2021.
//

import Foundation

import UIKit

class DetailViewController: BasicTableViewController {
    var isFavourited = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground

        let backArrowImage = UIImage(named: "arrow")
        let renderedImage = backArrowImage?.withRenderingMode(.alwaysOriginal)

        self.navigationController!.navigationBar.barStyle = .default
        self.navigationController!.navigationBar.backIndicatorImage = renderedImage
        self.navigationController!.navigationBar.backIndicatorTransitionMaskImage = renderedImage
        self.navigationController!.navigationBar.backgroundColor = .systemBackground
       
        let image = UIImage(named: "cook")
        navigationItem.titleView = UIImageView(image: image)
        
        let secod = UIImage(named: "heart")?.withRenderingMode(.alwaysOriginal)
        let button = UIBarButtonItem(image: secod, style: .plain, target: self, action: #selector(savedFavorites))

        self.navigationItem.rightBarButtonItem = button
        self.viewModel?.loadData { [weak self] _ in
            
            self?.registerCells()
            self?.tableView.reloadData()
        }
    }
    

    @objc func savedFavorites() {
        
        DetailViewCell()
    }
    

    
    

}
