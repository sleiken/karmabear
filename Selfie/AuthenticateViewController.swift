//
//  AuthenticateViewController.swift
//  Selfie
//
//  Created by TY on 11/7/16.
//  Copyright © 2016 subhb.org. All rights reserved.
//

import UIKit

class AuthenticateViewController: UIViewController, FBSDKLoginButtonDelegate{
    
//    @IBOutlet weak var signinBackgroundView: UIView!
//    @IBOutlet weak var signupBackgroundView: UIView!
//    @IBOutlet weak var signinEmailTextField: UITextField!
//    @IBOutlet weak var signinPasswordTextField: UITextField!
//    @IBOutlet weak var signupNameTextField: UITextField!
//    @IBOutlet weak var signupEmailTextField: UITextField!
//    @IBOutlet weak var signupPasswordTextField: UITextField!
//    @IBOutlet weak var activityIndicatorView: UIView!
//    @IBOutlet weak var passwordRevealBtn: UIButton!
    
     var httpHelper = HTTPHelper()
    
    let loginView: FBSDKLoginButton = {
        let button = FBSDKLoginButton()
        button.readPermissions = ["email"]
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let currentUserToken = NSUserDefaults.standardUserDefaults().stringForKey("FBToken")
        print(currentUserToken)
        
        if (FBSDKAccessToken.currentAccessToken() != nil){
            print("A user is already logged in!")
            
            let parameters = ["fields": "email, first_name, last_name, picture.type(large)"]
            FBSDKGraphRequest(graphPath: "me", parameters: parameters).startWithCompletionHandler{ (connection, result, error) -> Void in
                
                if error != nil {
                    print(error)
                    return
                }
                
                    let userEmail = result["email"] as! String
                    let firstName = result["first_name"] as! String
                    let userId = result["id"] as! String
                    let lastName = result["last_name"] as! String
                    let accessToken = FBSDKAccessToken.currentAccessToken().tokenString
                    
                    let httpRequest = self.httpHelper.buildRequest("auth/verify", method: "POST")
                    
//                  httpRequest.HTTPBody = "{\"email\":\"\(userEmail)\",\"first_name\":\"\(firstName)\",\"id\":\"\(userId)\",\"last_name\":\"\(lastName)\"}".
                
                    httpRequest.HTTPBody = "{\"id\":\"\(userId)\",\"access_token\":\"\(accessToken)\"}".dataUsingEncoding(NSUTF8StringEncoding)
                
                    self.httpHelper.sendRequest(httpRequest, completion: {(data: NSData!, error: NSError!) in
                        
                        guard error == nil else {
                            print(error)
                            return
                        }
                        do
                        {
                            print(data!)
                            let responseDict = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments)
                            
                            NSUserDefaults.standardUserDefaults().setValue("\(responseDict)", forKey: "FBToken")
                            NSUserDefaults.standardUserDefaults().synchronize()
                            
                            let currentUserToken = NSUserDefaults.standardUserDefaults().stringForKey("FBToken")
                            print(currentUserToken)
                            
                        } catch let error as NSError {
                            print(error)
                        }
                    })
            }
        }
        else
        {
            self.view.addSubview(loginView)
            loginView.center = view.center
            loginView.delegate = self
        }
    }
    
    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!) {
        print("User Logged In")

        if ((error) != nil)
        {
            // Process error
        }
        else if result.isCancelled {
            // Handle cancellations
        }
        else {
            // If you ask for multiple permissions at once, you
            // should check if specific permissions missing
            if result.grantedPermissions.contains("email")
            {
                // Do work
            }
        }
    }
    
    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!) {
        print("User Logged Out")
    }
}
