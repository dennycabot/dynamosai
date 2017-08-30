//
//  Utilities.swift
//  DynamosAI
//
//  Created by Denny Mathew on 30/08/17.
//  Copyright © 2017 Cabot. All rights reserved.
//

import Foundation

public enum DefaultsType {
    
    case isLoggedIn
    case email
    case password
    case name
}

class DefaultsHandler: NSObject {
    
    static let IS_LOGGED_IN = "isLoggedIn"
    
    static func save(_ value: String, defaultsType: DefaultsType) {
        switch defaultsType {
            
        case .email:
            UserDefaults.standard.set(value, forKey: EMAIL)
        case .password:
            UserDefaults.standard.set(value, forKey: PASSWORD)
        case .name:
            UserDefaults.standard.set(value, forKey: NAME)
        case .isLoggedIn:
            UserDefaults.standard.set(value, forKey: IS_LOGGED_IN)
        default:
            assert(false, "No Matching Defaults Type!")
            
        }
    }
}
