//
//  NewsDetailViewController.swift
//  NYTMostPopular
//
//  Created by Aftab Ahmed on 4/2/19.
//  Copyright © 2019 FAMCO. All rights reserved.
//

import UIKit
import WebKit

class NewsDetailViewController: UIViewController, WKUIDelegate {
    
    var webView: WKWebView!
    var url: URL!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        viewSetup()
    }
    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
    }
    
    func viewSetup() {
        let myRequest = URLRequest(url: url)
        webView.load(myRequest)
    }
}
