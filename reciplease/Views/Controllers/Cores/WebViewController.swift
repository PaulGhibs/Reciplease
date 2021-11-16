//
//  WebViewController.swift
//  reciplease
//
//  Created by Paul Ghibeaux on 05/11/2021.
//

import UIKit
import WebKit


class WebViewController: UIViewController {
    

    @IBOutlet weak var webView: WKWebView!
    
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    
    
    // MARK: - Init viewmodels

    var viewModel: WebViewModel?
    
    init(viewModel: WebViewModel) {
        self.viewModel = viewModel
        super.init(nibName: String(describing: WebViewController.self), bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(nibName: String(describing: WebViewController.self), bundle: nil)
    }
    
    // view did load
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // nav back arrow
        let backArrowImage = UIImage(named: "arrow")
        let renderedImage = backArrowImage?.withRenderingMode(.alwaysOriginal)

        self.navigationController!.navigationBar.barStyle = .default
        self.navigationController!.navigationBar.backIndicatorImage = renderedImage
        self.navigationController!.navigationBar.backIndicatorTransitionMaskImage = renderedImage
        self.navigationController!.navigationBar.backgroundColor = .systemBackground
       
        // nav title

        let image = UIImage(named: "cook")
        navigationItem.titleView = UIImageView(image: image)
        
        // load data call
        let request = URLRequest(url: self.viewModel!.url)
        self.webView.load(request)
    }

    override func viewDidAppear(_ animated: Bool) {
        // show spinner during loading
        self.loadingIndicator.isHidden = true
        self.loadingIndicator.stopAnimating()
    }



}
