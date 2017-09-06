//
//  APIRouter.swift
//  DynamosAI
//
//  Created by Denny Mathew on 30/08/17.
//  Copyright © 2017 Cabot. All rights reserved.
//

import Foundation
import Alamofire

public enum APIRouter: URLRequestConvertible {

    //API Routs
    case login(String, String) ///(Email, Password)
    case signup(String, String, String) ///(Name, Email, Password)
    case events
    case floorMap(String) ///Event Id
    
    //VARS
    var method: HTTPMethod {
        switch self {
        case .events:
            return .get
            
        case .login, .signup, .floorMap:
            return .post
        }
    }
    
    var path: String {
        switch self {
        case .login:
            return LOGIN
        
        case .signup:
            return SIGNUP
        
        case .events:
            return EVENTS
        
        case .floorMap:
            return FLOOR_MAP
        }
    }
    
    public func asURLRequest() throws -> URLRequest {
        let parameters: [String: Any] = {
            
            switch self {
            
            case .login(let email, let password):
                return [EMAIL : email, PASSWORD : password]
                
            case .signup(let name, let email, let password):
                return [NAME : name, EMAIL : email, PASSWORD : password]
                
            case .floorMap(let eventId):
                return [EVENT_ID : eventId]
                
            default:
                return [:]
            }
        }()
        
        
        let url = try BASE_URL.asURL()
        
        var request = URLRequest(url: url.appendingPathComponent(path))
        request.httpMethod = method.rawValue
        request.setValue(AUTH_TOKEN, forHTTPHeaderField: AUTH_TOKEN)
        request.setValue(TYPE_JSON, forHTTPHeaderField: CONTENT_TYPE)
        request.timeoutInterval = TimeInterval(10 * 1000)
        
        return try URLEncoding.default.encode(request, with: parameters)
    }
}
