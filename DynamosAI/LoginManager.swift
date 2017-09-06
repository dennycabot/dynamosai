//
//  LoginManager.swift
//  DynamosAI
//
//  Created by Denny Mathew on 31/08/17.
//  Copyright © 2017 Cabot. All rights reserved.
//

import UIKit

class LoginManager: NSObject {
    
    func login(with model: Login, _ completion: @escaping (_ error: Error?, _ loginResponse: LoginResponse? ) -> ()) {

        APIManager().callWebService(with: APIRouter.login(model.email!, model.password!)) { (error, response) in
            
            if error != nil {
                print("Error: \(String(describing: error))")
                return completion(error, nil)
            }
        
            else if response != nil {
                print("Response: \(String(describing: response))")
                
                guard let responseData = response?[DATA] as? [String: Any] else {
                    return
                }
                
                /* Set Login Response Model */
                let loginResponse = LoginResponse()
                loginResponse.authToken = responseData[AUTH_TOKEN] as! String
                loginResponse.email = responseData[EMAIL] as! String
                loginResponse.name = responseData[NAME] as! String
                
                return completion(nil, loginResponse)
            }
        }
    }
    
    func signup(with model: Signup, _ completion: @escaping (_ error: Error?, _ signupResponse: SignupResponse?) -> ()) {
        
        APIManager().callWebService(with: APIRouter.signup(model.name!, model.email!, model.password!)) { (error, response) in
            
            if error != nil {
                print("Error: \(String(describing: error))")
                return completion(error, nil)
            }
            
            else if response != nil {
                print("Response: \(String(describing: response))")
                
                guard let responseData = response?[DATA] as? [String: Any] else {
                    return
                }
                
                /* Set Signup Response Model */
                let signupResponse = SignupResponse()
                signupResponse.authToken = responseData[AUTH_TOKEN] as! String
                signupResponse.name = responseData[NAME] as! String
                signupResponse.email = responseData[EMAIL] as! String
                
                return completion(nil, signupResponse)
            }
        }
    }
}
