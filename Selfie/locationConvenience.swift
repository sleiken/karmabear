//
//  locationConvenience.swift
//  Selfie
//
//  Created by TY on 11/6/16.
//  Copyright © 2016 subhb.org. All rights reserved.
//

import UIKit
import Foundation

extension HTTPHelper {
    
    func getCharityLocations(JSONObject: AnyObject?, completionHandler: (result: [String]?, error: NSError?) -> Void) {
        
        if let dictionary = JSONObject {
            
           var result = [String]()
            
            if let lat = dictionary["lat"] as? String {
                result.append(lat)
                print("CAPTURED LAT")
            }
            if let lng = dictionary["lng"] as? String {
                result.append(lng)
                print("CAPTURED LNG")
            }
            completionHandler(result: result, error: nil)
            print(result)
        }
        
    }
}
