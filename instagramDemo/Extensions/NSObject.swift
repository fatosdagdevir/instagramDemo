//
//  NSObject.swift
//  instagramDemo
//
//  Created by Fatma Dagdevir [Set Yazilim] on 11/25/18.
//  Copyright © 2018 Fatma Dagdevir. All rights reserved.
//

import Foundation

extension NSObject {
    
    class var className: String {
        return String(describing: self)
    }
}
