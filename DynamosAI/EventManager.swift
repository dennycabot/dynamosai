//
//  EventManager.swift
//  DynamosAI
//
//  Created by Denny Mathew on 05/09/17.
//  Copyright © 2017 Cabot. All rights reserved.
//

import UIKit

class EventManager: NSObject {
    
    func eventList(_ completion: @escaping (_ error: Error?, _ response: EventListResponse?) -> ()) {
        
        APIManager().callWebService(with: APIRouter.events) { (error, response) in
            
            if error != nil {
                print("Error: \(String(describing: error))")
                return completion(error, nil)
            }
            
            else if response != nil {
                print("Response: \(String(describing: response))")
                
                guard let responseData = response?[DATA] as? [[String: Any]] else {
                    return
                }
                
                /* Set Event List Response Model */
                let eventListResponse = EventListResponse()
                eventListResponse.eventList = Array<Event>()
                
                for item in responseData {
                    
                    let event = Event()
                    event.id = item[EVENT_ID] as! String
                    event.title = item[TITLE] as! String
                    event.location = item[LOCATION] as! String
                    event.dateString = item[DATE] as! String
                    event.eventDescription = item[DESCRIPTION] as! String
                    eventListResponse.eventList.append(event)
                }
                
                return completion(nil, eventListResponse)
            }
        }
    }
    
    func eventMap(_ model: EventMap, completion: @escaping (_ error: Error?, _ response: EventMapResponse?) -> ()) {
        
        APIManager().callWebService(with: APIRouter.floorMap(model.id)) { (error, eventMapResponse) in
            
            if error != nil {
                print("Error: \(String(describing: error))")
                return completion(error, nil)
            }
                
            else if eventMapResponse != nil {
                print("Response: \(String(describing: eventMapResponse))")
                
                guard let responseData = eventMapResponse?[DATA] as? [String: Any] else {
                    return
                }
                
                /* Set Event Map Response Model */
                let eventMapResponse = EventMapResponse()
                eventMapResponse.layoutUrl = responseData[MAP] as! String
                
                return completion(nil, eventMapResponse)
            }
        }
    }
}
