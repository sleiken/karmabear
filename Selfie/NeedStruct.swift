//
//  NeedStruct.swift
//  Selfie
//
//  Created by TY on 11/8/16.
//  Copyright © 2016 subhb.org. All rights reserved.
//

import Foundation

struct NeedStruct {
    
    var id: Int
    var name: String
    var description: String?
    var quantityNeeded: Int?
    var status: String?
    
    init(dictionary: [String : AnyObject]) {
        
        self.id = (dictionary["id"] as? Int)!
        self.name = (dictionary["name"] as? String)!
        self.description = dictionary["description"]! as? String
        self.quantityNeeded = dictionary["quantity_needed"]! as? Int
        self.status = (dictionary["status"]! as? String)!
    }
}

