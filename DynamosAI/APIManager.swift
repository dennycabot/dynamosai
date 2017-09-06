//
//  APIManager.swift
//  DynamosAI
//
//  Created by Denny Mathew on 31/08/17.
//  Copyright © 2017 Cabot. All rights reserved.
//

import UIKit
import Alamofire

class APIManager: NSObject {

    /*----------------------------------------------------------------------------------------*/
                                //MARK:- Network Reachability
    /*----------------------------------------------------------------------------------------*/
    func isConnectedToInternet() -> Bool {
        return (NetworkReachabilityManager()!.isReachable)
    }
    
    /*----------------------------------------------------------------------------------------*/
                                //MARK:- Web Service Call
    /*----------------------------------------------------------------------------------------*/
    func callWebService(with route: APIRouter, completion: @escaping (_ error: Error?, _ response: [String: Any]?) -> ()) {
        
        /* NO INTERNET CONNECTION */
        if !isConnectedToInternet() {
            let networkError = NSError(domain: "", code: 404, userInfo: [NSLocalizedDescriptionKey: NO_NETWORK])
            return completion(networkError as Error , nil)
        }
        
        /* API REQUEST */
        Alamofire.request(route).responseJSON { response in
                
                guard response.result.isSuccess else {
                    print("Server Error: " + String(describing: response.error))
                    return completion(response.error, nil)
                }
                
                guard let responseJSON = response.result.value as? [String: Any] else {
                    print("Invalid Response from Server: " + String(describing: response.error))
                    return completion(response.error, nil)
                }
                
                completion(nil, responseJSON)
        }
    }
}
