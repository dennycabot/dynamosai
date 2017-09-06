//
//  Utilities.swift
//  DynamosAI
//
//  Created by Denny Mathew on 30/08/17.
//  Copyright © 2017 Cabot. All rights reserved.
//

import Foundation

public enum DefaultsKey {
    
    case isLoggedIn
    case email
    case password
    case name
}

class DefaultsHandler: NSObject {
    
    static let IS_LOGGED_IN = "isLoggedIn"
    
    static func save(_ value: String, key: DefaultsKey) {
        switch key {
            
        case .email:
            UserDefaults.standard.set(value, forKey: EMAIL)
        case .password:
            UserDefaults.standard.set(value, forKey: PASSWORD)
        case .name:
            UserDefaults.standard.set(value, forKey: NAME)
        case .isLoggedIn:
            UserDefaults.standard.set(value, forKey: IS_LOGGED_IN)
        }
    }
    
    static func getValue(for key: DefaultsKey) -> Any {
        
        switch key {
        case .email:
            return UserDefaults.standard.value(forKey: EMAIL) ?? "No Value"
            
        case .password:
            return UserDefaults.standard.value(forKey: PASSWORD) ?? "No Value"
            
        case .name:
            return UserDefaults.standard.value(forKey: NAME) ?? "No Value"
            
        case .isLoggedIn:
            return UserDefaults.standard.value(forKey: IS_LOGGED_IN) ?? false
        }
    }
}

extension TimeInterval {
    
    /* Convert Time Interval to Date String */
    func toDateString() -> String {
     
        let date = Date(timeIntervalSince1970: self)
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMM yyyy"
        formatter.locale = NSLocale(localeIdentifier: "en_US") as Locale!
        print("Converted Date: \(formatter.string(from: date as Date))")
        return formatter.string(from: date as Date)
    }
}
