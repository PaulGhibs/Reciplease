//
//  RecipesViewController.swift
//  reciplease
//
//  Created by Paul Ghibeaux on 17/09/2021.
//

import UIKit

class RecipesViewController: BasicTableViewController {
    fileprivate var aView : UIView?
    
    // viewwillappear because we  need to refresh view when user is coming

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.backgroundColor = .systemBackground
        // nav back image 
        let backArrowImage = UIImage(named: "arrow")
        let renderedImage = backArrowImage?.withRenderingMode(.alwaysOriginal)
        
        self.navigationController!.navigationBar.barStyle = .default
        self.navigationController!.navigationBar.backIndicatorImage = renderedImage
        self.navigationController!.navigationBar.backIndicatorTransitionMaskImage = renderedImage
        self.navigationController!.navigationBar.backgroundColor = .systemBackground
        self.navigationController?.navigationBar.backItem?.title = " "

        // nav title
        let image = UIImage(named: "cook")
        navigationItem.titleView = UIImageView(image: image)
        // spinner
        self.showSpinner()
        
        // load data vm call
        
        self.viewModel?.loadData { [weak self] _ in
            self?.registerCells()
            self?.stopSpinner()
            self?.tableView.reloadData()

        }
    }
    

}
// extension for showing spinner when it's loading
extension RecipesViewController {
    func showSpinner() {
        aView = UIView(frame: self.view.frame)
        aView?.backgroundColor = UIColor.systemBackground
        let ai = UIActivityIndicatorView(style: .medium)
        ai.center = aView!.center
        ai.startAnimating()
        aView?.addSubview(ai)
        self.view.addSubview(aView!)
        
    }
    func stopSpinner() {
        aView?.removeFromSuperview()
        aView = nil
    }
}
