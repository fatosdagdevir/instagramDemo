//
//  InstagramGlobal.swift
//  instagramDemo
//
//  Created by Fatma Dagdevir on 11/25/18.
//  Copyright © 2018 Fatma Dagdevir. All rights reserved.
//

import Foundation

class InstagramGlobal {
    
    static let shared = InstagramGlobal()
    
    var auth_token = ""
    
    private init() {}
}
