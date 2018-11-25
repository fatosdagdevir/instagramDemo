//
//  ErrorModel.swift
//  instagramDemo
//
//  Created by Fatma Dagdevir [Set Yazilim] on 11/25/18.
//  Copyright © 2018 Fatma Dagdevir. All rights reserved.
//

import Foundation
import SwiftyJSON

//TODO: implement error model

class ErrorModel:  Error {
    
    var errorCode: String!
    var errorMessage: String!
    
    required init(json: JSON) {
        
        errorCode = json["errorCode"].stringValue
        errorMessage = json["message"].stringValue
    }
}

