//
//  Constants.swift
//  instagramDemo
//
//  Created by Fatma Dagdevir [Set Yazilim] on 11/25/18.
//  Copyright © 2018 Fatma Dagdevir. All rights reserved.
//

import Foundation

struct Constants {
    
    private static let baseURL = "https://api.instagram.com/v1"
    
    struct API {
        
        static let INSTAGRAM_AUTHURL = "https://api.instagram.com/oauth/authorize/"
        
        static let INSTAGRAM_APIURl  = "https://api.instagram.com/v1/users/"
        
        static let INSTAGRAM_CLIENT_ID  = "d1bd54ae3eb042ddb844189bce4f235a"
        
        static let INSTAGRAM_CLIENTSERCRET = "1306f747932940b8a43e45c2380facb5"
        
        static let INSTAGRAM_REDIRECT_URI = "https://www.instagram.com/fatosdagdevir/"
        
        static let INSTAGRAM_ACCESS_TOKEN =  "access_token"
        
        static let INSTAGRAM_SCOPE = "public_content+likes+comments+relationships"
    }
    
    struct User {
        
        static let media = Constants.baseURL +  "/users/self/media/recent/?access_token=" + InstagramGlobal.shared.auth_token
        
    }
}
