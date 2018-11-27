//
//  PostModelView.swift
//  instagramDemo
//
//  Created by Fatma Dagdevir on 11/26/18.
//  Copyright © 2018 Fatma Dagdevir. All rights reserved.
//

import Foundation
import RxSwift

class PostViewModel {
    
    let disposeBag = DisposeBag()
    
    let userName: String
    let userPicture: String
    let location: String
    let post: String
    
    init(model: PostModel) {
        userName = model.user.username
        userPicture = model.user.profile_picture
        location = model.location.name
        post = model.image.url
    }
}
