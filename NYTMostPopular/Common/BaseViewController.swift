//
//  BaseViewController.swift
//  NYTMostPopular
//
//  Created by Aftab Ahmed on 4/2/19.
//  Copyright © 2019 FAMCO. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func showActivityIndicator() {
        let alert = UIAlertController(title: nil, message: "Please wait...", preferredStyle: .alert)
        
        let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.style = UIActivityIndicatorView.Style.gray
        loadingIndicator.startAnimating();
        
        alert.view.addSubview(loadingIndicator)
        DispatchQueue.main.async {
            UIApplication.shared.keyWindow?.rootViewController?.present(alert, animated: true, completion: nil)
        }
    }
    
    func hideActivityIndicator() {
        DispatchQueue.main.async {
            UIApplication.shared.keyWindow?.rootViewController?.dismiss(animated: false, completion: nil)
        }
    }
    
}
