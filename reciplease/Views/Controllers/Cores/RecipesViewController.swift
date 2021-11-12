//
//  RecipesViewController.swift
//  reciplease
//
//  Created by Paul Ghibeaux on 17/09/2021.
//

import UIKit

class RecipesViewController: BasicTableViewController {
    fileprivate var aView : UIView?
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
        self.showSpinner()
        self.viewModel?.loadData { [weak self] _ in
            self?.registerCells()
            self?.stopSpinner()
            self?.tableView.reloadData()

        }
    }
    

}

extension RecipesViewController {
    func showSpinner() {
        aView = UIView(frame: self.view.frame)
        aView?.backgroundColor = UIColor.init(red: 0.1, green: 0.1, blue: 0.1, alpha: 0.1)
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
