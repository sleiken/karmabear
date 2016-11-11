//
//  CharityDetailViewController.swift
//  Selfie
//
//  Created by TY on 11/8/16.
//  Copyright © 2016 subhb.org. All rights reserved.
//

import Foundation
import UIKit

class CharityDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    @IBOutlet weak var needsTableView: UITableView!
    @IBOutlet weak var eventsTableView: UITableView!
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var descLabel: UILabel!
    
    var passedId: Int?
    var imageUrl: String!
    
    var httpHelper = HTTPHelper()
    var idArray: Int!
    var descString: String!
    var eventData = [EventStruct]()
    var needData = [NeedStruct]()
    
    var needId: Int!
    var needTitle: String!
    var quantityNeed: Int!
    var needStatus: String!
    
    var eventId: Int!
    var eventTitle: String!
    var eventDescription: String!
    var eventStart: String!
    var eventEnd: String!
    var headersArr = ["Needs","Events"]
    
    let dimLevel: CGFloat = 0.5
    let dimSpeed: Double = 0.5
    
    override func viewDidLoad() {
        super.viewDidLoad()

        requestCharData()
        
        needsTableView.dataSource = self
        needsTableView.delegate = self
        needsTableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "needsCell")
        needsTableView.backgroundColor = UIColor.clearColor()
        
        eventsTableView.dataSource = self
        eventsTableView.delegate = self
        eventsTableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "eventsCell")
        eventsTableView.backgroundColor = UIColor.clearColor()
        
        
        descLabel.lineBreakMode = NSLineBreakMode.ByWordWrapping
        descLabel.numberOfLines = 0
        
        loadCharityDisplay()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func closeDetailView(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    @IBAction func followThisCharity(sender: AnyObject) {
        
        followCharity()
    }
    
    func loadCharityDisplay() {
        
        if imageUrl != nil {
            let url = NSURL(string: self.imageUrl!)
            print(url)
            
            dispatch_async(dispatch_get_main_queue(), {
                
                let thisData = NSData(contentsOfURL: url!)
                self.mainImageView.image = UIImage(data: thisData!)
            })
        }
        else{
            let url = NSURL(string: "https://s-media-cache-ak0.pinimg.com/originals/37/30/41/37304117db4d017b4ef48d309b046b62.png")
            
            dispatch_async(dispatch_get_main_queue(), {
                
                let thisData = NSData(contentsOfURL: url!)
                self.mainImageView.image = UIImage(data: thisData!)
            })
        }
        
        descLabel.text = descString
    }
    
    
    func requestCharData() {
        let currentCharity = (CharityModel.charityData[passedId!])
        print(passedId)
        
        let httpRequest = httpHelper.buildRequest("auth/charity", method: "POST")
        let currentUserToken = NSUserDefaults.standardUserDefaults().stringForKey("FBToken")
        let userToken = currentUserToken! as String
        print(userToken)
        
        httpRequest.HTTPBody = "{\"id\":\"\(currentCharity.id)\",\"token\":\"\(userToken)\"}".dataUsingEncoding(NSUTF8StringEncoding)
        
        httpHelper.sendRequest(httpRequest, completion: {(data: NSData!, error: NSError!) in
            
            guard error == nil else {
                print(error)
                return
            }
            do {
                let responseDict = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments)
                
                let needArr = responseDict["needs"] as? NSArray
                let eventArr = responseDict["events"] as? NSArray
                
                print(needArr)
                
                self.loadTableData(needArr, events: eventArr)
                
                dispatch_async(dispatch_get_main_queue(), {
                    self.needsTableView.reloadData()
                    self.eventsTableView.reloadData()
                })
                
            } catch let error as NSError {
                print(error)
            }
            
        })
        
    }
    
    func loadTableData(needs: NSArray?, events: NSArray?) {
        
        if !eventData.isEmpty{
            eventData.removeAll()
        }
        
        if !needData.isEmpty{
            needData.removeAll()
        }
        
        
        for need in needs! {
            needData.append(NeedStruct(dictionary: need as! [String: AnyObject]))
        }
        
        
        for event in events! {
            eventData.append(EventStruct(dictionary: event as! [String: AnyObject]))
        }
        
    }
    
    func followCharity() {
        let currentCharity = (CharityModel.charityData[passedId!])
        
        let httpRequest = httpHelper.buildRequest("auth/follow", method: "POST")
        let currentUserToken = NSUserDefaults.standardUserDefaults().stringForKey("FBToken")
        let userToken = currentUserToken! as String
        print(userToken)
        
        httpRequest.HTTPBody = "{\"id\":\"\(currentCharity.id)\",\"token\":\"\(userToken)\"}".dataUsingEncoding(NSUTF8StringEncoding)
        
        httpHelper.sendRequest(httpRequest, completion: {(data: NSData!, error: NSError!) in
            
            guard error == nil else {
                print(error)
                return
            }
            do {
                let responseDict = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments)
                print(responseDict)
                
            } catch let error as NSError {
                print(error)
            }
            
        })
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        var count:Int?
        
        if tableView == self.needsTableView {
            count = needData.count
            
        }
        if tableView == self.eventsTableView {
            count = eventData.count
        }
        
        return count!
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell:UITableViewCell?
        
        if tableView == self.needsTableView {
            cell = tableView.dequeueReusableCellWithIdentifier("needsCell", forIndexPath: indexPath)
            let needsDetail = needData[indexPath.row]
            cell!.textLabel!.text = needsDetail.name
        }
        
        if tableView == self.eventsTableView {
            cell = tableView.dequeueReusableCellWithIdentifier("eventsCell", forIndexPath: indexPath)
            let needsDetail = eventData[indexPath.row]
            cell!.textLabel!.text = needsDetail.name
        }
        
        return cell!
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if tableView == self.needsTableView {
            let actionForNeed = needData[indexPath.row]
//            donateToCharity(actionForNeed.id)
            needId = actionForNeed.id
            needTitle = actionForNeed.name
            quantityNeed = actionForNeed.quantityNeeded
            needStatus = actionForNeed.status
            performSegueWithIdentifier("needModal", sender: self)
        }
        
        if tableView == self.eventsTableView {
            let actionForEvent = eventData[indexPath.row]
//          
            eventId = actionForEvent.id
            eventTitle = actionForEvent.name
            eventDescription = actionForEvent.description
            eventStart = actionForEvent.start
            eventEnd = actionForEvent.end
            
            performSegueWithIdentifier("eventModal", sender: self)
        }
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        if tableView == self.needsTableView {
            title = headersArr[0]
        }
        if tableView == self.eventsTableView {
            title = headersArr[1]
        }
        
        return title
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if (segue.identifier == "needModal") {
            let viewController = segue.destinationViewController as! NeedModalViewController
            viewController.needId = needId
            viewController.needTitle = needTitle
            viewController.quantityNeed = quantityNeed
            viewController.status = needStatus
            
            viewController.modalPresentationStyle = .OverCurrentContext
        }
        
        if (segue.identifier == "eventModal") {
            let viewController = segue.destinationViewController as! EventModalViewController
            viewController.eventId = eventId
            viewController.eventTitle = eventTitle
            viewController.eventDescription = eventDescription
            viewController.eventStart = eventStart
            viewController.eventEnd = eventEnd
            
            viewController.modalPresentationStyle = .OverCurrentContext
        }
        
    }
    
    func UIColorFromHex(rgbValue:UInt32, alpha:Double=1.0)->UIColor {
        let red = CGFloat((rgbValue & 0xFF0000) >> 16)/256.0
        let green = CGFloat((rgbValue & 0xFF00) >> 8)/256.0
        let blue = CGFloat(rgbValue & 0xFF)/256.0
        
        return UIColor(red:red, green:green, blue:blue, alpha:CGFloat(alpha))
    }

}


