//
//  UserStruct.swift
//  Selfie
//
//  Created by TY on 11/9/16.
//  Copyright © 2016 subhb.org. All rights reserved.
//

import Foundation

struct UserStruct {
    
    var id: Int!
    var points: Int!
    var firstName: String!
    var lastName: String!
    var imageUrl: String!
    var email: String!
    var username: String!
    
    
    init(dictionary: [String : AnyObject]) {
        
        self.id = (dictionary["id"] as? Int)!
        self.points = (dictionary["points"] as? Int)!
        self.firstName = (dictionary["first_name"] as? String)!
        self.lastName = (dictionary["last_name"] as? String)!
        self.imageUrl = dictionary["image_url"]! as? String
        self.email = (dictionary["email"]! as? String)!
        self.username = (dictionary["username"]! as? String)!
    }
}
