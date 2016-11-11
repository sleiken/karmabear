//  UserActivityViewController.swift
//  Selfie
//
//  Created by TY on 11/9/16.
//  Copyright © 2016 subhb.org. All rights reserved.
//

import Foundation

class UserActivityViewController: UIViewController, UIScrollViewDelegate, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var userProfile: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var needsTableView: UITableView!
    @IBOutlet weak var eventsTableView: UITableView!
    @IBOutlet weak var pointsLabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var headerImage: UIImageView!
    
    var headersArr = ["My Contributions","Upcoming Events"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        needsTableView.dataSource = self
        needsTableView.delegate = self
        needsTableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "needsCell")
        needsTableView.backgroundColor = UIColor.clearColor()
        
        eventsTableView.dataSource = self
        eventsTableView.delegate = self
        eventsTableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "eventsCell")
        eventsTableView.backgroundColor = UIColor.clearColor()
        
        self.userProfile.layer.masksToBounds = true
        userProfile.layer.cornerRadius = 10
        
        setUpViews()
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.scrollView!.contentInset = UIEdgeInsetsMake(self.userProfile.frame.size.height-40, 0, 0, 0);
    }
    
    func setUpViews() {
        
        let activityView = UIView.init(frame: view.frame)
        activityView.backgroundColor = UIColor.grayColor()
        activityView.alpha = 1
        view.addSubview(activityView)
        
        let activitySpinner = UIActivityIndicatorView.init(activityIndicatorStyle: UIActivityIndicatorViewStyle.WhiteLarge)
        activitySpinner.center = view.center
        activitySpinner.startAnimating()
        activityView.addSubview(activitySpinner)
        
        let userData = CharityModel.userData[0]
        
        let url = NSURL(string: userData.imageUrl)
        print(url)
        
        
        let thisData = NSData(contentsOfURL: url!)
        let userImg = UIImage(data: thisData!)
        
        self.userProfile.image = userImg
        
        self.pointsLabel.text = String(userData.points)
        self.userNameLabel.text = "\(userData.firstName) \(userData.lastName)"
        
        let blurEffect = UIBlurEffect(style: .Light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = self.headerImage.frame
        
        self.headerImage.insertSubview(blurEffectView, atIndex: 0)
        
        activitySpinner.stopAnimating()
        activityView.removeFromSuperview()
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        var count:Int?
        
        if tableView == self.needsTableView {
            count = CharityModel.userNeeds.count
            
        }
        if tableView == self.eventsTableView {
            count = CharityModel.userEvents.count
        }
        
        return count!
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell:UITableViewCell?
        
        if tableView == self.needsTableView {
            cell = tableView.dequeueReusableCellWithIdentifier("needsCell", forIndexPath: indexPath)
            let needsDetail = CharityModel.userNeeds[indexPath.row]
            cell!.textLabel!.text = needsDetail.name
        }
        
        if tableView == self.eventsTableView {
            cell = tableView.dequeueReusableCellWithIdentifier("eventsCell", forIndexPath: indexPath)
            let needsDetail = CharityModel.userEvents[indexPath.row]
            cell!.textLabel!.text = needsDetail.name
        }
        
        cell?.backgroundColor = UIColorFromHex(0xF5F5F5)
        
        return cell!
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if tableView == self.needsTableView {
            let actionForNeed = CharityModel.userNeeds[indexPath.row]
            //            donateToCharity(actionForNeed.id)
//            needId = actionForNeed.id
//            needTitle = actionForNeed.name
//            quantityNeed = actionForNeed.quantityNeeded
//            needStatus = actionForNeed.status
            performSegueWithIdentifier("needModal", sender: self)
        }
        
        if tableView == self.eventsTableView {
            let actionForEvent = CharityModel.userEvents[indexPath.row]
            //
//            eventId = actionForEvent.id
//            eventTitle = actionForEvent.name
//            eventDescription = actionForEvent.description
//            eventStart = actionForEvent.start
//            eventEnd = actionForEvent.end
            
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
    
    func UIColorFromHex(rgbValue:UInt32, alpha:Double=1.0)->UIColor {
        let red = CGFloat((rgbValue & 0xFF0000) >> 16)/256.0
        let green = CGFloat((rgbValue & 0xFF00) >> 8)/256.0
        let blue = CGFloat(rgbValue & 0xFF)/256.0
        
        return UIColor(red:red, green:green, blue:blue, alpha:CGFloat(alpha))
    }
}
