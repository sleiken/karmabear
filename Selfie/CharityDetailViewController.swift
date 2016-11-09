//
//  CharityDetailViewController.swift
//  Selfie
//
//  Created by TY on 11/8/16.
//  Copyright © 2016 subhb.org. All rights reserved.
//

import Foundation
import UIKit

class CharityDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var needsTableView: UITableView!
    @IBOutlet weak var eventsTableView: UITableView!
    
    
    
    var passedId: Int?
    var httpHelper = HTTPHelper()
    var idArray: Int!
    var eventIdentifier: Int!
    var eventData = [EventStruct]()
    var needData = [NeedStruct]()
    
    var charityDetailData = [["THING"],["ANOTHER THING"]]
    let headerTitles = ["Needs", "Events"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        requestCharData()
        
        needsTableView.dataSource = self
        needsTableView.delegate = self
        needsTableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "needsCell")
        
        eventsTableView.dataSource = self
        eventsTableView.delegate = self
        eventsTableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "eventsCell")
        
        needsTableView.reloadData()
        eventsTableView.reloadData()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func closeDetailView(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func followCharity(sender: AnyObject) {
//        registerForEvent()
        followCharity()
    }
    
    @IBAction func donateToCharity(sender: AnyObject) {
        donateToCharity()
    }
    
    
    func requestCharData() {
        let currentCharity = (CharityModel.charityData[passedId!])
        
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
                print(responseDict)
                
                let needArr = responseDict["needs"] as? NSArray
                let eventArr = responseDict["events"] as? NSArray
                
                self.loadTableData(needArr, events: eventArr)
                
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
    
    func donateToCharity() {
        
        let httpRequest = httpHelper.buildRequest("auth/donate", method: "POST")
        let currentUserToken = NSUserDefaults.standardUserDefaults().stringForKey("FBToken")
        let userToken = currentUserToken! as String
        
        httpRequest.HTTPBody = "{\"id\":\"\(idArray)\",\"token\":\"\(userToken)\"}".dataUsingEncoding(NSUTF8StringEncoding)
        
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


    func registerForEvent() {
        
        let httpRequest = httpHelper.buildRequest("auth/register", method: "POST")
        let currentUserToken = NSUserDefaults.standardUserDefaults().stringForKey("FBToken")
        let userToken = currentUserToken! as String
        
        httpRequest.HTTPBody = "{\"id\":\"\(eventIdentifier)\",\"token\":\"\(userToken)\"}".dataUsingEncoding(NSUTF8StringEncoding)
        
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
        print("did select:      \(indexPath.row)  ")
    }
    
//    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        if section < headerTitles.count {
//            return headerTitles[section]
//        }
//        
//        return nil
//    }

}


