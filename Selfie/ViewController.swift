//
//  ViewController.swift
//  Selfie
//
//  Created by Behera, Subhransu on 29/8/14.
//  Copyright (c) 2014 subhb.org. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
  @IBOutlet weak var signinBackgroundView: UIView!
  @IBOutlet weak var signupBackgroundView: UIView!
  @IBOutlet weak var signinEmailTextField: UITextField!
  @IBOutlet weak var signinPasswordTextField: UITextField!
  @IBOutlet weak var signupNameTextField: UITextField!
  @IBOutlet weak var signupEmailTextField: UITextField!
  @IBOutlet weak var signupPasswordTextField: UITextField!
  @IBOutlet weak var activityIndicatorView: UIView!
  @IBOutlet weak var passwordRevealBtn: UIButton!
  @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var searchField: UITextField!
  
let cllocationManager: CLLocationManager = CLLocationManager()
  var httpHelper = HTTPHelper()

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
//    self.activityIndicatorView.layer.cornerRadius = 10
    mapView.delegate = self
    
    self.cllocationManager.requestAlwaysAuthorization()
    self.cllocationManager.requestWhenInUseAuthorization()
    
    cllocationManager.startUpdatingLocation()
    mapView.showsUserLocation = true
    
//    let httpRequest = httpHelper.buildRequest("charities", method: "GET")
//    
//    httpHelper.sendCharitySearchRequest(httpRequest, completion: {(response:[CLLocationCoordinate2D]!, error: NSError!) in
//        
//        guard error == nil else {
//            return
//        }
//    })
    
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
    }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  @IBAction func passwordRevealBtnTapped(sender: AnyObject) {
    self.passwordRevealBtn.selected = !self.passwordRevealBtn.selected
    
    if self.passwordRevealBtn.selected {
      self.signupPasswordTextField.secureTextEntry = false
    }
      
    else {
      self.signupPasswordTextField.secureTextEntry = true
    }
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
            
            /*Load annotations/overlay to map view once data is completely loaded*/
            dispatch_async(dispatch_get_main_queue(), {
                self.mapView.addAnnotations(annotations)
                self.mapView.showAnnotations(annotations, animated: true)
            })
        }
    }

    
  func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        let reuseId = "pin"
        var pinView = mapView.dequeueReusableAnnotationViewWithIdentifier(reuseId) as? MKPinAnnotationView
        
        if pinView == nil {
            
            pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
            pinView!.canShowCallout = true
            if #available(iOS 9.0, *) {
                pinView!.pinTintColor = UIColor.greenColor()
            }else {
                // Fallback on earlier versions
            }
            pinView!.rightCalloutAccessoryView = UIButton(type: .DetailDisclosure)
            pinView?.enabled = true
            
        }else {
            pinView!.annotation = annotation
        }
        
        return pinView
    }
    
    func mapView(mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        if control == view.rightCalloutAccessoryView{
            
            view.layer.cornerRadius = 0.5
            view.backgroundColor = UIColor.grayColor()
            
            let linkUrl = view.annotation!.subtitle!
//            if linkUrl!.rangeOfString("http") != nil{
//                if let link = view.annotation?.subtitle!{
//                    UIApplication.sharedApplication().openURL(NSURL(string: "\(link)")!)
        }
        else{
                dispatch_async(dispatch_get_main_queue(),{
//                    self.showAlert("Invalid", alertMessage: "This link is invalid", actionTitle: "Try Another")
                })
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
    self.signupNameTextField.text = nil
    self.signupEmailTextField.text = nil
    self.signupPasswordTextField.text = nil
    
    if self.signinEmailTextField.isFirstResponder() {
      self.signinEmailTextField.resignFirstResponder()
    }
    
    if self.signinPasswordTextField.isFirstResponder() {
      self.signinPasswordTextField.resignFirstResponder()
    }
    
    if self.signupBackgroundView.frame.origin.x != 0 {
      UIView.animateWithDuration(0.8, animations: { () -> Void in
        self.signinBackgroundView.frame = CGRectMake(-320, 134, 320, 284)
        self.signinBackgroundView.alpha = 0.3;
        
        self.signupBackgroundView.frame = CGRectMake(0, 134, 320, 284)
        self.signupBackgroundView.alpha = 1.0
        
        }, completion: nil)
    }
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
                for coordinate in responseDict!{
                    
                    if !CharityModel.charityData.isEmpty{
                        CharityModel.charityData.removeAll()
                    }
                    
                    CharityModel.charityData.append(CharityStruct(dictionary: coordinate as! [String : AnyObject]))
                    print(CharityModel.charityData)
                    
                    let json = coordinate as? [String:AnyObject]
                    let coordinatesToAppend = CLLocationCoordinate2D(latitude: (json!["lat"]! as? Double)!, longitude: (json!["lng"]! as? Double)!)
                    charityLocations.append(coordinatesToAppend)
                }
                print(responseDict)
                self.populateMapData(charityLocations)
                
            } catch let error as NSError {
                print(error)
            }
            
        })
        
    }
  
  
//  @IBAction func signupBtnTapped(sender: AnyObject) {
//    // Code to hide the keyboards for text fields
//    if self.signupNameTextField.isFirstResponder() {
//      self.signupNameTextField.resignFirstResponder()
//    }
//    
//    if self.signupEmailTextField.isFirstResponder() {
//      self.signupEmailTextField.resignFirstResponder()
//    }
//    
//    if self.signupPasswordTextField.isFirstResponder() {
//      self.signupPasswordTextField.resignFirstResponder()
//    }
//    
//    self.activityIndicatorView.hidden = false
//    
//    if self.signupNameTextField.text != "" && self.signupEmailTextField.text != ""
//        && self.signupPasswordTextField.text != ""{
//        makeSignUpRequest(self.signupNameTextField.text!, userEmail: self.signupEmailTextField.text!,
//                          userPassword: self.signupPasswordTextField.text!)
//    } else {
//        self.displayAlertMessage("Parameters Required", alertDescription:
//            "Some of the required parameters are missing")
//    }
//  }
  
//  @IBAction func signinBtnTapped(sender: AnyObject) {
//    // resign the keyboard for text fields
//    if self.signinEmailTextField.isFirstResponder() {
//      self.signinEmailTextField.resignFirstResponder()
//    }
//    
//    if self.signinPasswordTextField.isFirstResponder() {
//      self.signinPasswordTextField.resignFirstResponder()
//    }
//    
//    self.activityIndicatorView.hidden = false
//    
//    if self.signinEmailTextField.text != "" && self.signinPasswordTextField != "" {
//        makeSignInRequest(self.signinEmailTextField.text!, userPassword: self.signinPasswordTextField.text!)
//    }else {
//        self.displayAlertMessage("Parameters Required", alertDescription:
//            "Some of the required parameters are missing")
//    }
//  }
  
  func updateUserLoggedInFlag() {
    let defaults = NSUserDefaults.standardUserDefaults()
    defaults.setObject("loggedIn", forKey: "userLoggedIn")
    defaults.synchronize()
  }
  
  func saveApiTokenInKeychain(tokenDict:NSDictionary) {
    tokenDict.enumerateKeysAndObjectsUsingBlock({(dictKey, dictObj, stopBool) -> Void in
        var key = dictKey as! String
        var obj = dictObj as! String
        
        if key == "api_authtoken" {
//            KeyChainAccess.setPassword(obj, account: "Auth_Token", service: "KeyChainService")
            puts(key)
        }
        
        if key == "authtoken_expiry" {
//            KeyChainAccess.setPassword(obj, account: "Auth_Token_Expiry", service: "KeyChainService")
            puts(obj)
        }
        })
    
//    self.dismissViewControllerAnimated(true, completion: nil)
    puts("Login Successful")
  }
  
//  func makeSignUpRequest(userName:String, userEmail:String, userPassword:String) {
//    let httpRequest = httpHelper.buildRequest("signup", method: "POST", authType: HTTPRequestAuthType.HTTPBasicAuth)
//    
//    let encrypted_password = AESCrypt.encrypt(userPassword, password: HTTPHelper.API_AUTH_PASSWORD)
//    
//    httpRequest.HTTPBody = "{\"full_name\":\"\(userName)\",\"email\":\"\(userEmail)\",\"password\":\"\(encrypted_password)\"}".dataUsingEncoding(NSUTF8StringEncoding)
//    
//    httpHelper.sendRequest(httpRequest, completion: {(data: NSData!, error: NSError!) in
//        
//        guard error == nil else {
//            let errorMessage = self.httpHelper.getErrorMessage(error)
//            self.displayAlertMessage("Error", alertDescription: errorMessage as String)
//            return
//        }
//        
//        self.displaSigninView()
//        self.displayAlertMessage("Success", alertDescription: "Acount successfully created!")
//        
//        })
//  }
//  
//    func makeSignInRequest(userEmail:String, userPassword:String) {
//        let httpRequest = httpHelper.buildRequest("signin", method: "POST", authType: HTTPRequestAuthType.HTTPBasicAuth)
//        
//        let encrypted_password = AESCrypt.encrypt(userPassword, password: HTTPHelper.API_AUTH_PASSWORD)
//        
//        httpRequest.HTTPBody = "{\"email\":\"\(userEmail)\",\"password\":\"\(encrypted_password)\"}".dataUsingEncoding(NSUTF8StringEncoding)
//        
//        httpHelper.sendRequest(httpRequest, completion: {(data: NSData!, error: NSError!) -> Void in
//            
//            guard error == nil else {
//                let errorMessage = self.httpHelper.getErrorMessage(error)
//                self.displayAlertMessage("Error", alertDescription: errorMessage as String)
//                return
//            }
//            
//            do {
//            
//            self.activityIndicatorView.hidden = true
//            self.updateUserLoggedInFlag()
//        
//            let responseDict = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments) as! NSDictionary
//                
//            self.saveApiTokenInKeychain(responseDict)
//            }
//            
//            catch let completionError as NSError {
//                print(completionError)
//            }
//        })
//}
    
    static func sharedInstance() -> ViewController {
        
        struct Singleton {
            static var sharedInstance = ViewController()
        }
        return Singleton.sharedInstance
    }
}
