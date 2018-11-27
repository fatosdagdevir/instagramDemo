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

//extension Request: ReactiveCompatible { }
//
//extension Reactive where Base: DataRequest {
//
//    func responseJSON() -> Observable<Any> {
//        return Observable.create { observer in
//            let request = self.base.responseJSON { response in
//                switch response.result {
//                case .success(let value):
//                    observer.onNext(value)
//                    observer.onCompleted()
//                case .failure(let error):
//                    observer.onError(error)
//                }
//            }
//            return Disposables.create(with: request.cancel)
//        }
//    }
//}

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

    
//    func serviceCall(with url: String) {
//
//        _ = sessionManager.request(url).rx.responseJSON()
//            .map { data in
//                let json = JSON(data)
//                //return json["data"]
//                return Observable.just(json["data"])
//            }
//            .subscribe(onNext: { print($0) })
//    }
}
