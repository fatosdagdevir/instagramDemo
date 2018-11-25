//
//  UserMediaViewController.swift
//  instagramDemo
//
//  Created by Fatma Dagdevir [Set Yazilim] on 11/25/18.
//  Copyright © 2018 Fatma Dagdevir. All rights reserved.
//

import UIKit

class UserMediaViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        NetworkService.shared.request(method: .get, url: Constants.User.media, success: { (json) in
            let mediaList: [MediaModel] = MediaModel.toModels(json: json["data"])

        }) { (errormodel) in
            
        }
    
    }
}
