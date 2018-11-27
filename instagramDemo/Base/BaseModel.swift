//
//  BaseModel.swift
//  instagramDemo
//
//  Created by Fatma Dagdevir on 11/25/18.
//  Copyright © 2018 Fatma Dagdevir. All rights reserved.
//

import Foundation
import SwiftyJSON

class BaseModel {
    
    init() { }
    required init(json _: JSON) {}
    
    func toJSON() -> JSON? {
        return nil
    }
    
    static func toModels<M: BaseModel>(json: JSON) -> [M] {
        return json.arrayValue.map({ M(json: $0) })
    }
}
