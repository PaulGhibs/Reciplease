//
//  DetailViewController.swift
//  reciplease
//
//  Created by Paul Ghibeaux on 20/10/2021.
//

import Foundation
import UIKit

class DetailViewController: BasicTableViewController {


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

        self.viewModel?.loadData { _ in
            
            self.registerCells()
            self.tableView.reloadData()
        }
    }
    

}


