//
//  UserModel.swift
//  instagramDemo
//
//  Created by Fatma Dagdevir [Set Yazilim] on 11/25/18.
//  Copyright © 2018 Fatma Dagdevir. All rights reserved.
//

import Foundation
import SwiftyJSON

class UserModel: BaseModel {
    
    var id: String!
    var full_name: String!
    var profile_picture: String!
    var username: String!
    
    required init(json: JSON) {
        super.init(json: json)
        
        id = json["id"].stringValue
        full_name = json["full_name"].stringValue
        profile_picture = json["profile_picture"].stringValue
        username = json["username"].stringValue
    }
}


