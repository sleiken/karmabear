//
//  EventModalViewController.swift
//  Selfie
//
//  Created by TY on 11/9/16.
//  Copyright © 2016 subhb.org. All rights reserved.
//

import Foundation

class EventModalViewController: UIViewController {
    @IBOutlet weak var modalView: UIView!
    @IBOutlet weak var descriptionText: UILabel!
    @IBOutlet weak var startLabel: UILabel!
    @IBOutlet weak var endLabel: UILabel!
    
    var eventId: Int!
    var eventTitle: String!
    var eventDescription: String!
    var eventStart: String!
    var eventEnd: String!
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
        descriptionText.text = eventDescription
        startLabel.text = eventStart
        endLabel.text = eventEnd
        
        descriptionText.lineBreakMode = NSLineBreakMode.ByWordWrapping
        descriptionText.numberOfLines = 0
    }
    
    @IBAction func dismissModal(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func registerToThisEvent(sender: AnyObject) {
        registerForEvent(eventId)
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func registerForEvent(eventId: Int) {
        
        let httpRequest = httpHelper.buildRequest("auth/register", method: "POST")
        let currentUserToken = NSUserDefaults.standardUserDefaults().stringForKey("FBToken")
        let userToken = currentUserToken! as String
        
        httpRequest.HTTPBody = "{\"id\":\"\(eventId)\",\"token\":\"\(userToken)\"}".dataUsingEncoding(NSUTF8StringEncoding)
        
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
