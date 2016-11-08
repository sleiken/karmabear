//
//  CharityLocTableView.swift
//  Selfie
//
//  Created by TY on 11/7/16.
//  Copyright © 2016 subhb.org. All rights reserved.
//

import Foundation
import UIKit
class CharityLocTableView: UITableView, UITableViewDelegate {
    
    override func hitTest(point: CGPoint, withEvent event: UIEvent?) -> UIView? {
        let hitView = super.hitTest(point, withEvent: event)
        if (point.y<0)
        {
            return hitView
        }
        return hitView
    }   
}
