//
//  NetworkService.swift
//  instagramDemo
//
//  Created by Fatma Dagdevir [Set Yazilim] on 11/25/18.
//  Copyright © 2018 Fatma Dagdevir. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

typealias SuccessCompletion = (_ result: JSON) -> Void
typealias FailureCompletion = (ErrorModel) -> Void

extension NetworkService {
    
    func isReachableReachability()-> Bool {
        let networkStatus = NetworkReachabilityManager(host: "http://www.google.com")
        return networkStatus!.isReachable
    }
}

final class NetworkService {
    
    static let shared = NetworkService()
    
    open class MyServerTrustPolicyManager: ServerTrustPolicyManager {
        
        open override func serverTrustPolicy(forHost host: String) -> ServerTrustPolicy? {
            return ServerTrustPolicy.disableEvaluation
        }
    }
    
    static let configuration: URLSessionConfiguration = {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 30
        configuration.timeoutIntervalForResource = 30
        return configuration
    }()
    
    let sessionManager = SessionManager(configuration: configuration, delegate: SessionDelegate(), serverTrustPolicyManager: MyServerTrustPolicyManager(policies: [:]))
    
    func request(method: HTTPMethod, url: URLConvertible, parameters: [String: Any]? = nil, headers: [String: String]? = nil, success: @escaping SuccessCompletion, failure: @escaping FailureCompletion) {
        
        if !isReachableReachability() {
            print("No network") //TODO: show message
            return
        }
        
        var headerParameters = ["Content-Type": "application/json"]
        if let headers = headers {
            headerParameters.unionInPlace(dictionary: headers)
        }
        
        sessionManager.request(url, method: method, parameters: parameters, encoding: JSONEncoding.default, headers: headerParameters).validate(statusCode: 200...300).responseJSON { response in
            
            switch response.result {
            case .success(let data):
                let json = JSON(data)
                success(json)
            case .failure(let error):
                print(error)
                // failure(error as! ErrorModel)
            }
        }
    }
}
