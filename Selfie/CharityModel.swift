//
//  CharityModel.swift
//  Selfie
//
//  Created by TY on 11/7/16.
//  Copyright © 2016 subhb.org. All rights reserved.
//

import Foundation

class CharityModel {
    
    static var charityData = [CharityStruct]()
    
    class func sharedInstance() -> CharityModel{
        struct Singleton{
            static var sharedInstance = CharityModel()
        }
        return Singleton.sharedInstance
    }
}
