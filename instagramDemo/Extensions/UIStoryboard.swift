//
//  UIStoryboard.swift
//  instagramDemo
//
//  Created by Fatma Dagdevir on 11/25/18.
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
}
