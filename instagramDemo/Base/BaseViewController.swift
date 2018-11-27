//
//  BaseViewController.swift
//  instagramDemo
//
//  Created by Fatma Dagdevir on 11/25/18.
//  Copyright © 2018 Fatma Dagdevir. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    lazy var loading: UIActivityIndicatorView = {
        let screen = UIScreen.main.bounds
        let loading = UIActivityIndicatorView(frame: CGRect(x: screen.width / 2 - 25, y: screen.height / 2 - 25, width: 50, height: 50))
        loading.color = UIColor.purple
        view.addSubview(loading)
        view.bringSubview(toFront: loading)
        return loading
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func startLoading() {
        loading.startAnimating()
        loading.isHidden = false
    }
    func stopLoading() {
        loading.stopAnimating()
        loading.isHidden = true
    }
}
