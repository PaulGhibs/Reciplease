//
//  DetailViewController.swift
//  reciplease
//
//  Created by Paul Ghibeaux on 20/10/2021.
//

import Foundation

import UIKit

class DetailViewController: BasicTableViewController {
    
 
   

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.backgroundColor = .secondarySystemBackground
        title = "Reciplease"
        let backArrowImage = UIImage(named: "arrow")
        let renderedImage = backArrowImage?.withRenderingMode(.alwaysOriginal)
        
        self.navigationController!.navigationBar.barStyle = .black
        self.navigationController!.navigationBar.backIndicatorImage = renderedImage
        self.navigationController!.navigationBar.backIndicatorTransitionMaskImage = renderedImage
        self.navigationController!.navigationBar.backgroundColor = .darkGray
        self.navigationItem.leftBarButtonItem?.title = "Back"

       
        self.viewModel?.loadData { [weak self] _ in
            self?.registerCells()
            self?.tableView.reloadData()

        }
    }
   

    

}
