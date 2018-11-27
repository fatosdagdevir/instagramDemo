//
//  ImageModel.swift
//  instagramDemo
//
//  Created by Fatma Dagdevir on 11/25/18.
//  Copyright © 2018 Fatma Dagdevir. All rights reserved.
//

import Foundation
import SwiftyJSON

class ImageModel: BaseModel {
    
    var width: Int!
    var height: Int!
    var url: String!
    
    required init(json: JSON) {
        super.init(json: json)
        
        width = json["width"].intValue
        height = json["height"].intValue
        url = json["url"].stringValue
    }
}
