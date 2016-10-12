//
//  SelfieCollectionViewController.swift
//  Selfie
//
//  Created by Behera, Subhransu on 29/8/14.
//  Copyright (c) 2014 subhb.org. All rights reserved.
//

import UIKit

let reuseIdentifier = "SelfieCollectionViewCell"

class SelfieCollectionViewController: UICollectionViewController {
  var shouldFetchNewData = true
  var dataArray = [SelfieImage]()
  let httpHelper = HTTPHelper()
  
  override func viewDidAppear(animated: Bool) {
    super.viewDidAppear(true)
    
    let defaults = NSUserDefaults.standardUserDefaults()
    
    if defaults.objectForKey("userLoggedIn") == nil {
      if let loginController = self.storyboard?.instantiateViewControllerWithIdentifier("ViewController") as? ViewController {
        self.navigationController?.presentViewController(loginController, animated: true, completion: nil)
      }
    }
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  func setNavigationItems() {
    let logOutBtn = UIBarButtonItem(title: "logout", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(SelfieCollectionViewController.logoutBtnTapped))
    self.navigationItem.leftBarButtonItem = logOutBtn
    
    let navCameraBtn = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Camera, target: self, action: #selector(SelfieCollectionViewController.cameraBtnTapped))
    self.navigationItem.rightBarButtonItem = navCameraBtn
  }
  
  // 1. Clears the NSUserDefaults flag
  func clearLoggedinFlagInUserDefaults() {
  }
  
  // 2. Removes the data array
  func clearDataArrayAndReloadCollectionView() {
  }
  
  // 3. Clears API Auth token from Keychain
  func clearAPITokensFromKeyChain () {    
  }
  
  func logoutBtnTapped() {
  }
  
  func cameraBtnTapped() {
    displayCameraControl()
  }
  
  func loadSelfieData () {    
  }
  
  
  override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
    return 1
  }
    
  override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return self.dataArray.count
  }
  
  override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! SelfieCollectionViewCell
    return cell
  }
  
  // MARK: UICollectionViewDelegate
  
  override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
  }
}

// Camera Extension

extension SelfieCollectionViewController : UINavigationControllerDelegate, UIImagePickerControllerDelegate {
  func displayCameraControl() {
    let imagePickerController = UIImagePickerController()
    imagePickerController.delegate = self
    imagePickerController.allowsEditing = true
    
    if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera) {
      imagePickerController.sourceType = UIImagePickerControllerSourceType.Camera
      
      if UIImagePickerController.isCameraDeviceAvailable(UIImagePickerControllerCameraDevice.Front) {
        imagePickerController.cameraDevice = UIImagePickerControllerCameraDevice.Front
      } else {
        imagePickerController.cameraDevice = UIImagePickerControllerCameraDevice.Rear
      }
    } else {
      imagePickerController.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
    }
    
    self.presentViewController(imagePickerController, animated: true, completion: nil)
  }
  
//  func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
//  }
}

// Compose Selfie Extension

extension SelfieCollectionViewController : SelfieComposeDelegate {
  func presentComposeViewControllerWithImage(image:UIImage!) {    
  }
  
  func reloadCollectionViewWithSelfie(selfieImgObject: SelfieImage) {
  }
}

// Selfie Details Extension

extension SelfieCollectionViewController : SelfieEditDelegate {
  func pushDetailsViewControllerWithSelfieObject(selfieRowObj:SelfieImage!) {
  }
  
  func deleteSelfieObjectFromList(selfieImgObject: SelfieImage) {    
  }
}
