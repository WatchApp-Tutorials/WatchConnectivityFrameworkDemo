//
//  ViewController.swift
//  WatchConnectivityTutorial
//
//  Created by Yogesh Bharate on 04/12/15.
//  Copyright © 2015 Yogesh Bharate. All rights reserved.
//

import UIKit
import WatchConnectivity

class ViewController: UIViewController, WCSessionDelegate {
  
  // MARK: IBOutlets
  @IBOutlet var lblMessage: UILabel!
  @IBOutlet var txtvwUserName: UITextField!
  
  
  // MARK: Variables
  var session: WCSession!

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    if WCSession.isSupported() {
      session = WCSession.defaultSession()
      session.delegate = self
      session.activateSession()
    }
    
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  @IBAction func sendMessageToWatch(sender: AnyObject) {
    // Send message to Watch
    let userName = "\(txtvwUserName.text!)"
    session.sendMessage(["a":userName], replyHandler: nil, errorHandler: nil)
  }
  
  // MARK: WCSession Delegate Methods
  
  func session(session: WCSession, didReceiveMessage message: [String : AnyObject]) {
    dispatch_async(dispatch_get_main_queue(), {
      self.lblMessage.text = message["b"]! as? String
    })
  }
  

}

