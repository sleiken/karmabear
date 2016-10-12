//
//  ViewController.swift
//  Selfie
//
//  Created by Behera, Subhransu on 29/8/14.
//  Copyright (c) 2014 subhb.org. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  @IBOutlet weak var signinBackgroundView: UIView!
  @IBOutlet weak var signupBackgroundView: UIView!
  @IBOutlet weak var signinEmailTextField: UITextField!
  @IBOutlet weak var signinPasswordTextField: UITextField!
  @IBOutlet weak var signupNameTextField: UITextField!
  @IBOutlet weak var signupEmailTextField: UITextField!
  @IBOutlet weak var signupPasswordTextField: UITextField!
  @IBOutlet weak var activityIndicatorView: UIView!
  @IBOutlet weak var passwordRevealBtn: UIButton!
  
  let httpHelper = HTTPHelper()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    self.activityIndicatorView.layer.cornerRadius = 10
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
  
  
  @IBAction func signupBtnTapped(sender: AnyObject) {
    // Code to hide the keyboards for text fields
    if self.signupNameTextField.isFirstResponder() {
      self.signupNameTextField.resignFirstResponder()
    }
    
    if self.signupEmailTextField.isFirstResponder() {
      self.signupEmailTextField.resignFirstResponder()
    }
    
    if self.signupPasswordTextField.isFirstResponder() {
      self.signupPasswordTextField.resignFirstResponder()
    }
    
    self.activityIndicatorView.hidden = false
    
    if self.signupNameTextField.text != "" && self.signupEmailTextField.text != ""
        && self.signupPasswordTextField.text != ""{
        makeSignUpRequest(self.signupNameTextField.text!, userEmail: self.signupEmailTextField.text!,
                          userPassword: self.signupPasswordTextField.text!)
    } else {
        self.displayAlertMessage("Parameters Required", alertDescription:
            "Some of the required parameters are missing")
    }
  }
  
  @IBAction func signinBtnTapped(sender: AnyObject) {
    // resign the keyboard for text fields
    if self.signinEmailTextField.isFirstResponder() {
      self.signinEmailTextField.resignFirstResponder()
    }
    
    if self.signinPasswordTextField.isFirstResponder() {
      self.signinPasswordTextField.resignFirstResponder()
    }
    
    self.activityIndicatorView.hidden = false
    
    if self.signinEmailTextField.text != "" && self.signinPasswordTextField != "" {
        makeSignInRequest(self.signinEmailTextField.text!, userPassword: self.signinPasswordTextField.text!)
    }else {
        self.displayAlertMessage("Parameters Required", alertDescription:
            "Some of the required parameters are missing")
    }
  }
  
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
            puts("Got api token")
        }
        
        if key == "authtoken_expiry" {
//            KeyChainAccess.setPassword(obj, account: "Auth_Token_Expiry", service: "KeyChainService")
            puts("Got api token expiry")
        }
        })
    
    self.dismissViewControllerAnimated(true, completion: nil)
  }
  
  func makeSignUpRequest(userName:String, userEmail:String, userPassword:String) {
    let httpRequest = httpHelper.buildRequest("signup", method: "POST", authType: HTTPRequestAuthType.HTTPBasicAuth)
    
    let encrypted_password = AESCrypt.encrypt(userPassword, password: HTTPHelper.API_AUTH_PASSWORD)
    
    httpRequest.HTTPBody = "{\"full_name\":\"\(userName)\",\"email\":\"\(userEmail)\",\"password\":\"\(encrypted_password)\"}".dataUsingEncoding(NSUTF8StringEncoding)
    
    httpHelper.sendRequest(httpRequest, completion: {(data: NSData!, error: NSError!) in
        
        guard error == nil else {
            let errorMessage = self.httpHelper.getErrorMessage(error)
            self.displayAlertMessage("Error", alertDescription: errorMessage as String)
            return
        }
        
        self.displaSigninView()
        self.displayAlertMessage("Success", alertDescription: "Acount successfully created!")
        
        })
  }
  
    func makeSignInRequest(userEmail:String, userPassword:String) {
        let httpRequest = httpHelper.buildRequest("signin", method: "POST", authType: HTTPRequestAuthType.HTTPBasicAuth)
        
        let encrypted_password = AESCrypt.encrypt(userPassword, password: HTTPHelper.API_AUTH_PASSWORD)
        
        httpRequest.HTTPBody = "{\"email\":\"\(userEmail)\",\"password\":\"\(encrypted_password)\"}".dataUsingEncoding(NSUTF8StringEncoding)
        
        httpHelper.sendRequest(httpRequest, completion: {(data: NSData!, error: NSError!) -> Void in
            
            guard error == nil else {
                let errorMessage = self.httpHelper.getErrorMessage(error)
                self.displayAlertMessage("Error", alertDescription: errorMessage as String)
                return
            }
            
            do {
            
            self.activityIndicatorView.hidden = true
            self.updateUserLoggedInFlag()
        
            let responseDict = try NSJSONSerialization.JSONObjectWithData(data,
                                                                      options: NSJSONReadingOptions.AllowFragments) as! NSDictionary
            self.saveApiTokenInKeychain(responseDict)
            }
            
            catch let completionError as NSError {
                print(completionError)
            }
        })
}
}
