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
  
let cllocationManager: CLLocationManager = CLLocationManager()
  var httpHelper = HTTPHelper()
    var LocArr: NSMutableArray = NSMutableArray()
    var charityId: Int?

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
  
    func populateMapData(newCoordArr:[CLLocationCoordinate2D]) {
        
        if !mapView.annotations.isEmpty{
            mapView.removeAnnotations(mapView.annotations)
        }
        
        let coordinateArray = newCoordArr
        
        var annotations = [MKPointAnnotation]()
        print(coordinateArray)
        
        for s in  coordinateArray {
            
            self.cllocationManager.delegate = self
            
            /* Get the lat and lon values to create a coordinate */
            let lat = CLLocationDegrees(s.latitude)
            let lon = CLLocationDegrees(s.longitude)
            let coordinate = CLLocationCoordinate2D(latitude: lat, longitude: lon)
            
            /* Make the map annotation with the coordinate and other student data */
            let annotation = MKPointAnnotation()
            annotation.coordinate = coordinate
            
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
        let reuseId = "pin"
        var pinView = mapView.dequeueReusableAnnotationViewWithIdentifier(reuseId) as? MKPinAnnotationView
 
            pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
            pinView!.canShowCallout = true
            if #available(iOS 9.0, *) {
                pinView!.pinTintColor = UIColor.greenColor()
            }else {
                // Fallback on earlier versions
            }
            pinView!.rightCalloutAccessoryView = UIButton(type: .DetailDisclosure)
        
            pinView!.annotation = annotation
        
        return pinView
    }
    
    func mapView(mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        if control == view.rightCalloutAccessoryView{
            
            view.layer.cornerRadius = 0.5
            view.backgroundColor = UIColor.grayColor()
            
            let linkUrl = view.annotation!.subtitle!
////            if linkUrl!.rangeOfString("http") != nil{
////                if let link = view.annotation?.subtitle!{
////                    UIApplication.sharedApplication().openURL(NSURL(string: "\(link)")!)
////                }
//            }else{
//                dispatch_async(dispatch_get_main_queue(),{
//                    self.showAlert("Invalid", alertMessage: "This link is invalid", actionTitle: "Try Another")
//                })
//            }
        }
    }
  
  func displaSigninView () {
    self.signinEmailTextField.text = nil
    self.signinPasswordTextField.text = nil
    
    if self.signupNameTextField.isFirstResponder() {
      self.signupNameTextField.resignFirstResponder()
    }
    
    if self.signupEmailTextField.isFirstResponder() {
      self.signupEmailTextField.resignFirstResponder()
    }
    
    if self.signupPasswordTextField.isFirstResponder() {
      self.signupPasswordTextField.resignFirstResponder()
    }
    
    if self.signinBackgroundView.frame.origin.x != 0 {
      UIView.animateWithDuration(0.8, animations: { () -> Void in
        self.signupBackgroundView.frame = CGRectMake(320, 134, 320, 284)
        self.signinBackgroundView.alpha = 0.3
        
        self.signinBackgroundView.frame = CGRectMake(0, 134, 320, 284)
        self.signinBackgroundView.alpha = 1.0
        }, completion: nil)
    }
  }
  
  func displaySignupView () {
    
      UIView.animateWithDuration(0.8, animations: { () -> Void in
        self.mapView.frame = CGRectMake(-320, 134, 320, 284)
        self.mapView.alpha = 0.3;
        
        self.mapView.frame = CGRectMake(0, 134, 320, 284)
        self.mapView.alpha = 1.0
        
        }, completion: nil)
  }
  
  func displayAlertMessage(alertTitle:String, alertDescription:String) -> Void {
    // hide activityIndicator view and display alert message
    self.activityIndicatorView.hidden = true
    let errorAlert = UIAlertView(title:alertTitle, message:alertDescription, delegate:nil, cancelButtonTitle:"OK")
    errorAlert.show()
  }
  
  @IBAction func createAccountBtnTapped(sender: AnyObject) {
    self.displaySignupView()
  }
  
  @IBAction func cancelBtnTapped(sender: AnyObject) {
    self.displaSigninView()
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
                
                var charityLocations: [CLLocationCoordinate2D] = []
                
                if !CharityModel.charityData.isEmpty{
                    CharityModel.charityData.removeAll()
                }
                
                for coordinate in responseDict!{
                    print(coordinate)
                    
                    CharityModel.charityData.append(CharityStruct(dictionary: coordinate as! [String : AnyObject]))
                    
                    let json = coordinate as? [String:AnyObject]
                    let coordinatesToAppend = CLLocationCoordinate2D(latitude: (json!["lat"]! as? Double)!, longitude: (json!["lng"]! as? Double)!)
                    charityLocations.append(coordinatesToAppend)
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
            print(CharityModel.charityData[indexPath.row])
            cell?.textLabel?.text = CharityModel.charityData[indexPath.row].name
        }
        
        return cell!
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        
        if CharityModel.charityData.count != 0 {
            let selectedCharity = CharityModel.charityData[indexPath.row]
            
            charityId = indexPath.row
            performSegueWithIdentifier("charityDetail", sender: self)
        }else{
            showAlert("Invalid", alertMessage: "It looks like this link is invalid", actionTitle: "Try Another")
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if (segue.identifier == "charityDetail") {
            let viewController = segue.destinationViewController as! CharityDetailViewController
            viewController.passedId = charityId
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

    
    static func sharedInstance() -> ViewController {
        
        struct Singleton {
            static var sharedInstance = ViewController()
        }
        return Singleton.sharedInstance
    }
}
