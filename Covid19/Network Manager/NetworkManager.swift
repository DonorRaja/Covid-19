//
//  NetworkManager.swift
//  Covid19
//
//  Created by DonorRaja on 20/04/20.
//  Copyright © 2020 DonorRaja. All rights reserved.
//

import Foundation
import UIKit
import AFNetworking


typealias RequestCompletionHandler = (Any?,Error?) -> Void

class NetworkManager: NSObject {
    
    class func globalCasesRequestWithJsonResponse(networkCompletionHandler: @escaping  RequestCompletionHandler){
        let manager = AFHTTPSessionManager()
        
        manager.get("https://api.covid19api.com/summary", parameters: nil, headers: nil, progress: { (operation) in
            print(operation)
        }, success: { (error, responseObject) in
            print(responseObject!)
            GlobalCasesDetails.init(caseResponse: responseObject as! [String : AnyObject])
            networkCompletionHandler(responseObject, error as? Error)
        }, failure: {(error, responseObject) in
            networkCompletionHandler(responseObject, error as? Error)
        })
    }
}
