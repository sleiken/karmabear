//
//  CharityAnnotation.swift
//  Selfie
//
//  Created by TY on 11/9/16.
//  Copyright © 2016 subhb.org. All rights reserved.
//

import MapKit

class CharityAnnotation: NSObject, MKAnnotation{
    
    init(coordinate: CLLocationCoordinate2D) {
        self.coordinate = coordinate
        super.init()
    }
    
    @objc var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    var phone: String!
    var image: UIImage!
    var address: String!
}
