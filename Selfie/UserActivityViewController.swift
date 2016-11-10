//
//  UserActivityViewController.swift
//  Selfie
//
//  Created by TY on 11/9/16.
//  Copyright © 2016 subhb.org. All rights reserved.
//

import Foundation

class UserActivityViewController: UIViewController {
    @IBOutlet weak var userProfile: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = NSURL(string: CharityModel.userData[0].imageUrl)
        print(url)
        
            
            let thisData = NSData(contentsOfURL: url!)
            let userImg = UIImage(data: thisData!)
            
            self.userProfile.image = userImg
    }
    
}
