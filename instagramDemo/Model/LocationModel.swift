//
//  LocationModel.swift
//  instagramDemo
//
//  Created by Fatma Dagdevir on 11/25/18.
//  Copyright © 2018 Fatma Dagdevir. All rights reserved.
//

import Foundation
import SwiftyJSON

class LocationModel: BaseModel {
    
    var id: String!
    var latitude: String!
    var longitude: String!
    var name: String!
    
    required init(json: JSON) {
        super.init(json: json)
        
        id = json["id"].stringValue
        latitude = json["latitude"].stringValue
        longitude = json["longitude"].stringValue
        name = json["name"].stringValue
    }
}
