//
//  InstagramServiceClient.swift
//  instagramDemo
//
//  Created by Fatma Dagdevir on 11/26/18.
//  Copyright © 2018 Fatma Dagdevir. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import Alamofire
import SwiftyJSON

enum ServiceFailureReason: Int, Error {
    case unAuthorized = 401
    case notFound = 404
}

final class InstagramServiceClient {
    
    static let shared = InstagramServiceClient()
    let sessionManager = SessionManager()
    
    func getResponse(with url: String) -> Observable<JSON> {
        return Observable.create { observer in
            self.sessionManager.request(url)
                .responseJSON { response in
                    switch response.result {
                    case .success(let data):
                        let json = JSON(data)
                        observer.onNext(json["data"])
                        observer.onCompleted()
                    case .failure(let error):
                        if let statusCode = response.response?.statusCode, let reason = ServiceFailureReason(rawValue: statusCode) {
                            observer.onError(reason)
                        }
                        observer.onError(error)
                    }
            }
            return Disposables.create()
        }
    }
}
