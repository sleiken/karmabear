//
//  NeedsStruct.swift
//  Selfie
//
//  Created by TY on 11/8/16.
//  Copyright © 2016 subhb.org. All rights reserved.
//

import Foundation

struct EventStruct {
    
    var id: Int
    var name: String
    var description: String?
    var giversNeeded: Int?
    var start: String?
    var end: String?
    
    init(dictionary: [String : AnyObject]) {
        
        self.id = (dictionary["id"] as? Int)!
        self.name = (dictionary["name"] as? String)!
        self.description = dictionary["description"]! as? String
        self.giversNeeded = dictionary["givers_needed"]! as? Int
        self.start = (dictionary["start"]! as? String)!
        self.end = (dictionary["end"]! as? String)!
    }
}
