//
//  LoginViewController.swift
//  DynamosAI
//
//  Created by Denny Mathew on 30/08/17.
//  Copyright © 2017 Cabot. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Do any additional setup after loading the view.
        let loginManager = LoginManager()
        
        let requestModel = Login(email: "dynamos@gmail.com", password: "cabot1235")
        
        loginManager.login(with: requestModel) { (error, loginResponse) in
            if (loginResponse != nil) {
                print("Success Logging in! :)")
                print("Auth Token: \(String(describing: loginResponse?.authToken))")
                print("Name: \(String(describing: loginResponse?.name))")
                print("Email: \(String(describing: loginResponse?.email))")
            }
            
            else {
                print("Error Logging in! :(")
            }
        }
        
        /*
 
        
        let requestModel = Signup(email: "dynamos@cabotsolutions.com", name: "Dynamos", password: "cabot1234")
        loginManager.signup(with: requestModel) { (errro, signupResponse) in
            
            if signupResponse != nil {
                print("Success Signing Up! :)")
                print("Auth Token: \(String(describing: signupResponse!.authToken))")
                print("Name: \(String(describing: signupResponse!.name))")
                print("Email: \(String(describing: signupResponse!.email))")
            }
            
            else {
                print("Error Signing Up! :(")
            }
        }
         
        let eventManager = EventManager()
        
        eventManager.eventList { (error, eventList) in
            
            if eventList != nil {
                print("Fetching Event List Success! :)")
                print(eventList!.eventList)
            }
            
            else {
                print("Fetching Event List Failed! :(")
            }
        }
 
        let eventMap = EventMap()
        eventMap.id = "event_001"
        eventManager.eventMap(eventMap) { (error, response) in
            print("Map Url: \(String(describing: response?.layoutUrl))")
        }
        */
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
