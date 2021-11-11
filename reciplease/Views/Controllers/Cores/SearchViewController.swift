//
//  SearchViewController.swift
//  reciplease
//
//  Created by Paul Ghibeaux on 16/09/2021.
//

import UIKit

class SearchViewController: BasicTableViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.backItem?.title = "Reciplease"

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Reciplease"
        self.viewModel?.loadData { _ in
            self.tableView.reloadData()
            self.registerCells()

        }
    }


}

   
