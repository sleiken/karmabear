//
//  CharityDetailViewController.swift
//  Selfie
//
//  Created by TY on 11/8/16.
//  Copyright © 2016 subhb.org. All rights reserved.
//

import Foundation
import UIKit

class CharityDetailViewController: UIViewController {
    var passedId: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let currentCharity = (CharityModel.charityData[passedId!])
    }
    
    @IBAction func closeDetailView(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func followCharity(sender: AnyObject) {
        
    }
    
    func requestCharData() {
        HTTPHelper.buildRequest("auth/charity", method: "POST")
        
        
    }
}
