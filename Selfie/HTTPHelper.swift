//
//  HTTPHelper.swift
//  Selfie
//
//  Created by Subhransu Behera on 18/11/14.
//  Copyright (c) 2014 subhb.org. All rights reserved.
//

import Foundation

enum HTTPRequestAuthType {
  case HTTPBasicAuth
  case HTTPTokenAuth
}

enum HTTPRequestContentType {
  case HTTPJsonContent
  case HTTPMultipartContent
}

struct HTTPHelper {
  static let API_AUTH_NAME = "tydaniels"
  static let API_AUTH_PASSWORD = "C1380C0D40A07DE25220D8931552A242D4B3544DD94C97FFCD83A7338B5763DD"
  static let BASE_URL = "https://salty-refuge-72885.herokuapp.com/api"
  
  func buildRequest(path: String!, method: String, authType: HTTPRequestAuthType,
    requestContentType: HTTPRequestContentType = HTTPRequestContentType.HTTPJsonContent, requestBoundary:String = "") -> NSMutableURLRequest {
      // 1. Create the request URL from path
      let requestURL = NSURL(string: "\(HTTPHelper.BASE_URL)/\(path)")
      let request = NSMutableURLRequest(URL: requestURL!)
      
      // Set HTTP request method and Content-Type
      request.HTTPMethod = method
      
      // 2. Set the correct Content-Type for the HTTP Request. This will be multipart/form-data for photo upload request and application/json for other requests in this app
      switch requestContentType {
      case .HTTPJsonContent:
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
      case .HTTPMultipartContent:
        let contentType = "multipart/form-data; boundary=\(requestBoundary)"
        request.addValue(contentType, forHTTPHeaderField: "Content-Type")
      }
      
      // 3. Set the correct Authorization header.
      switch authType {
      case .HTTPBasicAuth:
        // Set BASIC authentication header
        let basicAuthString = "\(HTTPHelper.API_AUTH_NAME):\(HTTPHelper.API_AUTH_PASSWORD)"
        let utf8str = basicAuthString.dataUsingEncoding(NSUTF8StringEncoding)
        let base64EncodedString = utf8str?.base64EncodedStringWithOptions(NSDataBase64EncodingOptions(rawValue: 0))
        
        request.addValue("Basic \(base64EncodedString!)", forHTTPHeaderField: "Authorization")
      case .HTTPTokenAuth:
        // Retreieve Auth_Token from Keychain
        if let userToken = KeychainAccess.passwordForAccount("Auth_Token", service: "KeyChainService") as String? {
          // Set Authorization header
          request.addValue("Token token=\(userToken)", forHTTPHeaderField: "Authorization")
        }
      }
      
      return request
  }
  
  
  func sendRequest(request: NSURLRequest, completion:(NSData!, NSError!) -> Void) -> () {
    // Create a NSURLSession task
    let session = NSURLSession.sharedSession()
    let task = session.dataTaskWithRequest(request) { (data: NSData?, response: NSURLResponse?, error: NSError?) -> Void in
        
        guard error == nil && data != nil else{
            print(error)
            completion(nil, error)
            return
        }
        guard let httpResponse = response as? NSHTTPURLResponse where httpResponse.statusCode == 200 else{
            completion(nil, error)
            return
        }
        do {
            completion(data, nil)
        } catch let parserError as NSError{
            print(parserError)
        }
    }
//      if error != nil {
//        dispatch_async(dispatch_get_main_queue(), { () -> Void in
//          completion(data, error)
//        })
//        
//        return
//      }
//      
//      dispatch_async(dispatch_get_main_queue(), {
//        if let httpResponse = response as? NSHTTPURLResponse {
//          if httpResponse.statusCode == 200 {
//            completion(data, nil)
//          }
//            if let data = data {
//                do {
//            }
//        }catch let error as NSError {
//            print(error.localizedDescription)
//        }
//      }else if let error = error {
//        print(error!.localizedDescription)
//        }
//    }
    
    // start the task
    task.resume()
  }
  
  func uploadRequest(path: String, data: NSData, title: String) -> NSMutableURLRequest {
    let boundary = "---------------------------14737809831466499882746641449"
    let request = buildRequest(path, method: "POST", authType: HTTPRequestAuthType.HTTPTokenAuth,
      requestContentType:HTTPRequestContentType.HTTPMultipartContent, requestBoundary:boundary) as NSMutableURLRequest
    
    let bodyParams : NSMutableData = NSMutableData()
    
    // build and format HTTP body with data
    // prepare for multipart form uplaod
    
    let boundaryString = "--\(boundary)\r\n"
    let boundaryData = boundaryString.dataUsingEncoding(NSUTF8StringEncoding) as NSData!
    bodyParams.appendData(boundaryData)
    
    // set the parameter name
    let imageMeteData = "Content-Disposition: attachment; name=\"image\"; filename=\"photo\"\r\n".dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false)
    bodyParams.appendData(imageMeteData!)
    
    // set the content type
    let fileContentType = "Content-Type: application/octet-stream\r\n\r\n".dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false)
    bodyParams.appendData(fileContentType!)
    
    // add the actual image data
    bodyParams.appendData(data)
    
    let imageDataEnding = "\r\n".dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false)
    bodyParams.appendData(imageDataEnding!)
    
    let boundaryString2 = "--\(boundary)\r\n"
    let boundaryData2 = boundaryString.dataUsingEncoding(NSUTF8StringEncoding) as NSData!
    
    bodyParams.appendData(boundaryData2)
    
    // pass the caption of the image
    let formData = "Content-Disposition: form-data; name=\"title\"\r\n\r\n".dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false)
    bodyParams.appendData(formData!)
    
    let formData2 = title.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false)
    bodyParams.appendData(formData2!)
    
    let closingFormData = "\r\n".dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false)
    bodyParams.appendData(closingFormData!)
    
    let closingData = "--\(boundary)--\r\n"
    let boundaryDataEnd = closingData.dataUsingEncoding(NSUTF8StringEncoding) as NSData!
    
    bodyParams.appendData(boundaryDataEnd)
    
    request.HTTPBody = bodyParams
    return request
  }
  
  func getErrorMessage(error: NSError) -> NSString {
    var errorMessage : NSString
    
    // return correct error message
    if error.domain == "HTTPHelperError" {
      let userInfo = error.userInfo as NSDictionary!
      errorMessage = userInfo.valueForKey("message") as! NSString
    } else {
      errorMessage = error.description
    }
    
    return errorMessage
  }
}
