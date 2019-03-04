//
//  BeginWorkoutVC.swift
//  EZWorkout
//
//  Created by Yilei Huang on 2019-03-03.
//  Copyright © 2019 Spencer Symington. All rights reserved.
//

import UIKit
import Foundation

class workoutRecVC: UIViewController {

    @IBOutlet weak var timerLabel: UILabel!
    
    var timer = Timer()
    override func viewDidLoad() {
        super.viewDidLoad()
        
         timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector:#selector(self.tick) , userInfo: nil, repeats: true)
    }
    
    @objc func tick() {
        timerLabel.text = DateFormatter.localizedString(from: Date(),
                                                              dateStyle: .medium,
                                                              timeStyle: .medium)
    }
    
    @IBAction func recordButtonAction(_ sender: Any) {
        
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
