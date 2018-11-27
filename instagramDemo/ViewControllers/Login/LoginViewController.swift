//
//  LoginViewController.swift
//  instagramDemo
//
//  Created by Fatma Dagdevir on 11/25/18.
//  Copyright © 2018 Fatma Dagdevir. All rights reserved.
//

import UIKit
import WebKit

class LoginViewController: BaseViewController {
    
    @IBOutlet weak var webView: UIWebView!
    var loadingView: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startLoading()
        webView.delegate = self
        openWebLogin()
    }
    
    func openWebLogin() {
        
        let authURL = String(format: "%@?client_id=%@&redirect_uri=%@&response_type=token&scope=%@&DEBUG=True", arguments: [Constants.API.INSTAGRAM_AUTHURL, Constants.API.INSTAGRAM_CLIENT_ID, Constants.API.INSTAGRAM_REDIRECT_URI, Constants.API.INSTAGRAM_SCOPE ])
        
        guard let url = URL(string: authURL) else {
            return
        }
        let urlRequest = URLRequest(url: url)
        webView.loadRequest(urlRequest)
      
    }
    
    func checkRequestForCallbackURL(request: URLRequest) -> Bool {
        
        let requestURLString = (request.url?.absoluteString)! as String
        
        if requestURLString.hasPrefix(Constants.API.INSTAGRAM_REDIRECT_URI) {
            let range: Range<String.Index> = requestURLString.range(of: "#access_token=")!
            handleAuth(authToken: requestURLString.substring(from: range.upperBound))
            return false
        }
        return true
    }
    
    func handleAuth(authToken: String)  {
        print(authToken)
        InstagramGlobal.shared.auth_token = authToken
        
        let userMediaVC: PostsViewController = UIStoryboard.main.instantiateViewController()
        let navController = UINavigationController(rootViewController: userMediaVC)
        self.present(navController, animated: true, completion: nil)
    }
}

extension LoginViewController: UIWebViewDelegate {
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        loading.stopAnimating()
    }
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        return checkRequestForCallbackURL(request: request)
    }
    func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
        stopLoading()
    }
}
