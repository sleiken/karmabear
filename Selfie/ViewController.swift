//
//  ViewController.swift
//  Selfie
//
//  Created by Behera, Subhransu on 29/8/14.
//  Copyright (c) 2014 subhb.org. All rights reserved.
//

import UIKit
import MapKit
import Foundation

var tableView: UITableView!

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate, UIScrollViewDelegate, UITableViewDelegate, UITableViewDataSource {
    
  @IBOutlet weak var signinBackgroundView: UIView!
  @IBOutlet weak var signupBackgroundView: UIView!
  @IBOutlet weak var signinEmailTextField: UITextField!
  @IBOutlet weak var signinPasswordTextField: UITextField!
  @IBOutlet weak var signupNameTextField: UITextField!
  @IBOutlet weak var signupEmailTextField: UITextField!
  @IBOutlet weak var signupPasswordTextField: UITextField!
  @IBOutlet weak var activityIndicatorView: UIView!
  @IBOutlet weak var passwordRevealBtn: UIButton!
  @IBOutlet weak var tableView: CharityLocTableView!
    
  @IBOutlet weak var mapView: MKMapView!
  @IBOutlet weak var searchField: UITextField!
    @IBOutlet weak var userNavBtn: UIButton!
    
  
  let cllocationManager: CLLocationManager = CLLocationManager()
  let transitionManager = TransitionManager()
    
  var httpHelper = HTTPHelper()
  var LocArr: NSMutableArray = NSMutableArray()
  var charityId: Int?
  var passImageUrl: String!
  var descString: String!

  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
    self.tableView.backgroundColor = UIColor.clearColor()
    self.tableView.delegate = self
    self.tableView.dataSource = self
    
    self.cllocationManager.requestAlwaysAuthorization()
    self.cllocationManager.requestWhenInUseAuthorization()
    
    cllocationManager.startUpdatingLocation()
    mapView.showsUserLocation = true
    mapView.delegate = self
    
    getUserData()
    
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.tableView!.contentInset = UIEdgeInsetsMake(self.mapView.frame.size.height-40, 0, 0, 0);
    }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
    
    @IBAction func unwindToViewController (sender: UIStoryboardSegue){
        
    }
    
    func getUserData() {
        
        let currentUserToken = NSUserDefaults.standardUserDefaults().stringForKey("FBToken")
        let userToken = currentUserToken! as String
        
        let httpRequest = httpHelper.buildRequest("auth/giver", method: "POST")
        httpRequest.HTTPBody = "{\"token\":\"\(userToken)\"}".dataUsingEncoding(NSUTF8StringEncoding)
        
        httpHelper.sendRequest(httpRequest, completion: {(data: NSData!, error: NSError!) in
            
            guard error == nil else {
                print(error)
                return
            }
            do {
                
                if !CharityModel.userData.isEmpty {
                    CharityModel.userData.removeAll()
                }
                
                let responseDict = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments)
                
                let user = responseDict["giver"] as! [String:AnyObject]
                
                let userEvents = responseDict["events"] as! NSArray
                let userNeeds = responseDict["needs"] as! NSArray
        
                
                CharityModel.userData.insert((UserStruct(dictionary: user)), atIndex: 0)
                print(CharityModel.userData[0])
                
                for event in userEvents {
                    CharityModel.userEvents.append(EventStruct(dictionary: event as! [String : AnyObject] ))
                }
                
                for need in userNeeds {
                    CharityModel.userNeeds.append(NeedStruct(dictionary: need as! [String : AnyObject]))
                }
                
                print(CharityModel.userEvents)
                print(CharityModel.userNeeds)
                
            
            } catch let error as NSError {
                print(error)
            }
        })
        
        let userImg = UIImage(named: "UserIcon")
        self.userNavBtn.setImage(userImg, forState: .Normal)
    }
  
    func populateMapData(newCoordArr:[CharityStruct]) {
        
        if !mapView.annotations.isEmpty{
            mapView.removeAnnotations(mapView.annotations)
        }
        
        let coordinateArray = newCoordArr
        
        var annotations = [CharityAnnotation]()
        
        for s in  coordinateArray {
            
            self.cllocationManager.delegate = self
            
            /* Get the lat and lon values to create a coordinate */
            let lat = CLLocationDegrees(s.latitude)
            let lon = CLLocationDegrees(s.longitude)
            let coordinate = CLLocationCoordinate2D(latitude: lat, longitude: lon)
            
            /* Make the map annotation with the coordinate and other student data */
            let annotation = CharityAnnotation(coordinate: coordinate)
            
            annotation.title = s.name
            annotation.subtitle = s.address[0] as? String
            annotation.phone = s.phone
            
            let imageString = NSURL(string: "\(s.imageUrl)")
            let imageData = NSData(contentsOfURL: imageString!)
            if imageData != nil {
                annotation.image = UIImage(data: imageData!)
            }
            
            /* Add the annotation to the array */
            annotations.append(annotation)
            /*Append cllocations to represent overlay connections between annotations*/
            self.mapView.delegate = self
            /*Load annotations/overlay to map view once data is completely loaded*/
            dispatch_async(dispatch_get_main_queue(), {
                self.mapView.addAnnotations(annotations)
                self.mapView.showAnnotations(annotations, animated: true)
            })
        }
        
        tableView.reloadData()
    }

    
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        
        let reuseIdentifier = "pin"
        
        var v = mapView.dequeueReusableAnnotationViewWithIdentifier(reuseIdentifier)
        if v == nil {
            v = AnnotationView(annotation: annotation, reuseIdentifier: reuseIdentifier)
            v!.canShowCallout = true
        }
        else {
            v!.annotation = annotation
        }
        
        if CharityModel.charityData.count > 0 {
            let customPointAnnotation = annotation as! CharityAnnotation
            
            if customPointAnnotation.image != nil {
                v!.image = resizeImage(customPointAnnotation.image!, newWidth: 60)
                v!.layer.borderWidth = 2
                v!.layer.borderColor = UIColor.grayColor().CGColor
                v!.layer.cornerRadius = 10
                
            }
        }
        else{
            v!.image = UIImage(named: "KarmaBear")
        }
        
        v!.rightCalloutAccessoryView = UIButton(type: .DetailDisclosure)
        
        return v
    }
    
    func mapView(mapView: MKMapView, didSelect view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        
        if control == view.rightCalloutAccessoryView{
            
            view.layer.cornerRadius = 0.5
            
            print(view.annotation?.title)
            
        }
        
        
//CUSTOM CALLOUT IMPLEMENTATION
        

//            let charityAnnotation = view.annotation as! CharityAnnotation
//            let views = NSBundle.mainBundle().loadNibNamed("CustomCalloutView", owner: nil, options: nil)
//            let calloutView = views?[0] as! CustomCalloutView
//            calloutView.charityName.text = charityAnnotation.title
//            calloutView.charityAddress.text = charityAnnotation.address
//            calloutView.charityPhone.text = charityAnnotation.phone
//            print(calloutView.charityPhone.text)
//            
//            let tapGesture = UITapGestureRecognizer(target: self, action: Selector(("CallPhoneNumber:")))
//            calloutView.charityPhone.addGestureRecognizer(tapGesture)
//            calloutView.charityPhone.userInteractionEnabled = true
//            calloutView.charityImage.image = charityAnnotation.image
//            // 3
//            calloutView.center = CGPoint(x: view.bounds.size.width / 2, y: -calloutView.bounds.size.height*0.52)
//            view.addSubview(calloutView)
//            mapView.setCenterCoordinate((view.annotation?.coordinate)!, animated: true)


    }
    
    func mapView(mapView: MKMapView, didDeselect view: MKAnnotationView) {
        if view.isMemberOfClass(AnnotationView.self)
        {
            for subview in view.subviews
            {
                subview.removeFromSuperview()
            }
        }
    }

  
  func displayAlertMessage(alertTitle:String, alertDescription:String) -> Void {
    // hide activityIndicator view and display alert message
    self.activityIndicatorView.hidden = true
    let errorAlert = UIAlertView(title:alertTitle, message:alertDescription, delegate:nil, cancelButtonTitle:"OK")
    errorAlert.show()
  }
  

    @IBAction func searchCoordBtn() {
        searchDBForLocation(searchField.text!)
    
    }

  
    
    
    func searchDBForLocation(search: String) {
        let httpRequest = httpHelper.buildRequest("search", method: "POST")
        httpRequest.HTTPBody = "{\"search\":\"\(search)\"}".dataUsingEncoding(NSUTF8StringEncoding)
        
        httpHelper.sendRequest(httpRequest, completion: {(data: NSData!, error: NSError!) in
            
            guard error == nil else {
                print(error)
                return
            }
            do {
                
                let responseDict = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions()) as? NSArray
                
                var charityLocations = [CharityStruct]()
                
                if !CharityModel.charityData.isEmpty{
                    CharityModel.charityData.removeAll()
                }
                
                for coordinate in responseDict!{
                    
                    print(coordinate)
                    
                    CharityModel.charityData.append(CharityStruct(dictionary: coordinate as! [String : AnyObject]))
                    
                    charityLocations.append(CharityStruct(dictionary: coordinate as! [String : AnyObject]))
                }
                
                dispatch_async(dispatch_get_main_queue(), {
                    self.populateMapData(charityLocations)
                })
                
            } catch let error as NSError {
                print(error)
            }
            
        })
        
        dispatch_async(dispatch_get_main_queue(), {
            self.tableView.reloadData()
        })
        
        UIView.animateWithDuration(2, animations: {
            var newCenter = self.tableView.center
            newCenter.y -= 100
            var mapCenter = self.mapView.center
            mapCenter.y += 100
            self.tableView.center = newCenter
            }, completion: { finished in
                print("Table levitating!")
        })
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        if (scrollView.contentOffset.y > self.mapView.frame.size.height * 1 ) {
            scrollView .setContentOffset(CGPointMake(scrollView.contentOffset.x, self.mapView.frame.size.height * 1), animated: true)
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var count = 0
        if CharityModel.charityData.count <= 0 {
            count = 5
        }
        else{
            count = CharityModel.charityData.count
        }
        
        return count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:UITableViewCell? = self.tableView!.dequeueReusableCellWithIdentifier("cell") as UITableViewCell?
        
        
        if CharityModel.charityData.count == 0 {
            cell?.textLabel?.text = "No Data"
        }
        else {
            print("New Charity Data")
            cell?.textLabel?.text = CharityModel.charityData[indexPath.row].name
        }
        
        return cell!
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        
        if CharityModel.charityData.count != 0 {
            let selectedCharity = CharityModel.charityData[indexPath.row]
            print(selectedCharity)
            
            
            passImageUrl = selectedCharity.imageUrl
            descString = selectedCharity.description
   
            charityId = indexPath.row
            performSegueWithIdentifier("charityDetail", sender: self)
        }else{
            showAlert("Invalid", alertMessage: "It looks like this link is invalid", actionTitle: "Try Another")
        }
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        print(segue.identifier)
        
        if (segue.identifier == "charityDetail") {
            let viewController = segue.destinationViewController as! CharityDetailViewController
            viewController.passedId = charityId
            viewController.imageUrl = passImageUrl
            viewController.descString = descString
        }
        
        if (segue.identifier == "activityDetail") {
            let toViewController = segue.destinationViewController as! UserActivityViewController
        }
        
    }


  
  func updateUserLoggedInFlag() {
    let defaults = NSUserDefaults.standardUserDefaults()
    defaults.setObject("loggedIn", forKey: "userLoggedIn")
    defaults.synchronize()
  }
    
    func showAlert(alertTitle: String, alertMessage: String, actionTitle: String){
        let alert = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: .Alert)
        alert.addAction(UIAlertAction(title: actionTitle, style: .Default, handler: nil))
        
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    func resizeImage(image: UIImage, newWidth: CGFloat) -> UIImage {
        
        let scale = newWidth / image.size.width
        let newHeight = image.size.height * scale
        UIGraphicsBeginImageContext(CGSizeMake(newWidth, newHeight))
        image.drawInRect(CGRectMake(0, 0, newWidth, newHeight))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
    }

    
    static func sharedInstance() -> ViewController {
        
        struct Singleton {
            static var sharedInstance = ViewController()
        }
        return Singleton.sharedInstance
    }
}
