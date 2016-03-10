//
//  InterfaceController.swift
//  WatchApp Extension
//
//  Created by Yogesh Bharate on 04/12/15.
//  Copyright © 2015 Yogesh Bharate. All rights reserved.
//

import WatchKit
import Foundation
import WatchConnectivity


class InterfaceController: WKInterfaceController, WCSessionDelegate {
  
  // MARK: IBOutlets
  @IBOutlet var lblMessage: WKInterfaceLabel!
  
  // MARK: Variables
  var session : WCSession!
  var welcomeMessage : String = "GoodBye"
  
  override func awakeWithContext(context: AnyObject?) {
    super.awakeWithContext(context)
    
    // Configure interface objects here.
  }
  
  override func willActivate() {
    // This method is called when watch view controller is about to be visible to user
    super.willActivate()
    
    if WCSession.isSupported() {
      session = WCSession.defaultSession()
      session.delegate = self
      session.activateSession()
    }
    
  }
  
  override func didDeactivate() {
    // This method is called when watch view controller is no longer visible
    super.didDeactivate()
  }
  
  @IBAction func sendMessageToiPhone() {
    
    // Send message to iPhone
    session.sendMessage(["b":welcomeMessage], replyHandler: nil, errorHandler: nil)
  }
  
  func session(session: WCSession, didReceiveMessage message: [String : AnyObject]) {
    let userName = message["a"]! as? String
    welcomeMessage = "Welcome " + userName!
    lblMessage.setText(userName)
  }
  
  override func contextForSegueWithIdentifier(segueIdentifier: String) -> AnyObject? {
    return welcomeMessage
  }
  
}
