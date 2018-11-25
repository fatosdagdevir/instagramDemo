//
//  UIStoryboard.swift
//  instagramDemo
//
//  Created by Fatma Dagdevir [Set Yazilim] on 11/25/18.
//  Copyright © 2018 Fatma Dagdevir. All rights reserved.
//

import UIKit

extension UIStoryboard {
    
    // - Storyboards
    static var main: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: nil)
    }
    
    // - Methods
    func instantiateViewController<VC: UIViewController>() -> VC {
        guard let viewController = self.instantiateViewController(withIdentifier: VC.className) as? VC
            else { fatalError("could not instantiateViewController with identifier \(VC.className)") }
        return viewController
    }
    
//    func instantiateViewControllerWithNavigationController<VC: UIViewController>() -> (navigationController: UINavigationController, viewController: VC) {
//        guard let viewController = self.instantiateViewController(withIdentifier: VC.className) as? VC
//            else { fatalError("could not instantiateViewController with identifier \(VC.className)") }
//
//        let navigationController = ADSNavigationController(rootViewController: viewController)
//
//        viewController.navigationItem.backBarButtonItem = UIBarButtonItem.init(title: "", style: .plain, target: nil, action: nil)
//
//        return (navigationController, viewController)
//    }
}
