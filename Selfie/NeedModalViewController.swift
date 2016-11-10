//
//  NeedModalViewController.swift
//  Selfie
//
//  Created by TY on 11/9/16.
//  Copyright © 2016 subhb.org. All rights reserved.
//

import Foundation

class NeedModalViewController: UIViewController {
    @IBOutlet weak var modalView: UIView!
    @IBOutlet weak var quantityInput: UITextField!
    @IBOutlet weak var needsList: UILabel!
    @IBOutlet weak var needNumber: UILabel!
    @IBOutlet weak var donateLabel: UILabel!
    
    var needId: Int!
    var needTitle: String!
    var quantityNeed: Int!
    var status: String!
    var httpHelper = HTTPHelper()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        modalView.layer.cornerRadius = 10
        
        let blurEffect = UIBlurEffect(style: .Dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = self.view.frame
        
        self.view.insertSubview(blurEffectView, atIndex: 0)
        
        setupView()
    }
    
    func setupView() {
        needsList.text = needTitle
        needNumber.text = String(quantityNeed)
    }
    
    @IBAction func dismissModal(sender: AnyObject) {
            self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func giveToCharity(sender: AnyObject) {
        donateToCharity(needId)
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func donateToCharity(needId: Int) {
        
        let httpRequest = httpHelper.buildRequest("auth/donate", method: "POST")
        let currentUserToken = NSUserDefaults.standardUserDefaults().stringForKey("FBToken")
        let userToken = currentUserToken! as String
        let quantity = quantityInput.text!
        
        httpRequest.HTTPBody = "{\"id\":\"\(needId)\",\"token\":\"\(userToken)\",\"quantity\":\"\(quantity)\"}".dataUsingEncoding(NSUTF8StringEncoding)
        
        httpHelper.sendRequest(httpRequest, completion: {(data: NSData!, error: NSError!) in
            
            guard error == nil else {
                print(error)
                return
            }
            do {
                //                let responseDict = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments)
                //                print(responseDict)
                
            } catch let error as NSError {
                print(error)
            }
        })
    }
    
    
}
