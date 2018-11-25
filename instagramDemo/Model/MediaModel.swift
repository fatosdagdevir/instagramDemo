//
//  MediaModel.swift
//  instagramDemo
//
//  Created by Fatma Dagdevir [Set Yazilim] on 11/25/18.
//  Copyright © 2018 Fatma Dagdevir. All rights reserved.
//

import Foundation
import SwiftyJSON

class MediaModel: BaseModel {
    
    var id: String!
    var user: UserModel!
    var location: LocationModel!
    var image: ImageModel!
    var caption: String!
    
    required init(json: JSON) {
        super.init(json: json)
        
        id = json["id"].stringValue
        user = UserModel(json: json["user"])
        location = LocationModel(json: json["location"])
        image = ImageModel(json: json["images"]["standard_resolution"])
        caption = json["caption"]["text"].stringValue        
    }    
}
