//
//  InterfaceController.swift
//  WorkoutWatch Extension
//
//  Created by Yilei Huang on 2019-03-12.
//  Copyright © 2019 Spencer Symington. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {
    @IBOutlet weak var recordButton: WKInterfaceButton!
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        
       
    }
    @IBAction func recordAction() {
        let phrases = ["start", "end"]
        presentTextInputController(withSuggestions: phrases,
                                   allowedInputMode: .plain,
                                   completion: { (result) -> Void in
                                    //if let choice = result as? String {
                                    
                                    let text:String = result?.first as! String
                                    print(text)
                                     iosWatch.getOutputFromWatch(inputStr: text)
                                    
        })
        
        
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
