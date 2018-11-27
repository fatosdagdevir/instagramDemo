//
//  PostListViewModel.swift
//  instagramDemo
//
//  Created by Fatma Dagdevir on 11/27/18.
//  Copyright © 2018 Fatma Dagdevir. All rights reserved.
//

import Foundation
import RxSwift
import SwiftyJSON

class PostListViewModel {

    var posts = Variable<[PostViewModel]>([])
    let disposeBag = DisposeBag()
    
    init(service: InstagramServiceClient = InstagramServiceClient.shared) {
        
        service.getResponse(with: Constants.User.media).subscribe( onNext: { [weak self] json in
            let postList: [PostModel] = PostModel.toModels(json: json)
            self?.posts.value = postList.map({ PostViewModel(model: $0) })

        }).disposed(by: disposeBag)
    }
}
