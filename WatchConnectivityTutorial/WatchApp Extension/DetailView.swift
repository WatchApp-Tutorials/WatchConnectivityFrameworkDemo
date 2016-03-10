//
//  DetailView.swift
//  WatchConnectivityTutorial
//
//  Created by Yogesh Bharate on 04/12/15.
//  Copyright © 2015 Yogesh Bharate. All rights reserved.
//

import WatchKit
import Foundation


class DetailView: WKInterfaceController {

  @IBOutlet var detailLabel: WKInterfaceLabel!
  
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
      
      if let val = context as? String {
        let finalString = val + " To WatchKit World !!!!"
        detailLabel.setText(finalString)
      } else {
        detailLabel.setText("Ooooop !!! Error occured !!!!!!")
      }
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
      
      // Show the label here.
      
      
      
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
