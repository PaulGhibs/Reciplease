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
    
    var viewModel: WebViewModel?
    
    init(viewModel: WebViewModel) {
        self.viewModel = viewModel
        super.init(nibName: String(describing: WebViewController.self), bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(nibName: String(describing: WebViewController.self), bundle: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backArrowImage = UIImage(named: "arrow")
        let renderedImage = backArrowImage?.withRenderingMode(.alwaysOriginal)

        self.navigationController!.navigationBar.barStyle = .default
        self.navigationController!.navigationBar.backIndicatorImage = renderedImage
        self.navigationController!.navigationBar.backIndicatorTransitionMaskImage = renderedImage
        self.navigationController!.navigationBar.backgroundColor = .systemBackground
       

        let image = UIImage(named: "cook")
        navigationItem.titleView = UIImageView(image: image)
        
        let request = URLRequest(url: self.viewModel!.url)
        self.webView.load(request)
    }

    override func viewDidAppear(_ animated: Bool) {
        self.loadingIndicator.isHidden = true
        self.loadingIndicator.stopAnimating()
    }



}
