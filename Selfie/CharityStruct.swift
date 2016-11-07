//
//  CharityStruct.swift
//  Selfie
//
//  Created by TY on 11/7/16.
//  Copyright © 2016 subhb.org. All rights reserved.
//

import Foundation

struct CharityStruct {
    
    var name: String
    var address: NSArray
    var latitude: Double
    var longitude: Double
    var description: String?
    var phone: String?
    var url: String?
    
    init(dictionary: [String : AnyObject]) {

        self.name = (dictionary["name"] as? String)!
        self.address = (dictionary["address"] as? NSArray)!
        self.latitude = (dictionary["lat"] as? Double)!
        self.longitude = (dictionary["lng"] as? Double)!
        self.description = dictionary["description"]! as? String
        self.phone = dictionary["phone"]! as? String
        self.url = (dictionary["url"]! as? String)!
    }
}
