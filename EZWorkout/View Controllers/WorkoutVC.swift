//
//  WorkoutVC.swift
//  EZWorkout
//
//  Created by Yilei Huang on 2019-03-03.
//  Copyright © 2019 Spencer Symington. All rights reserved.
//

import UIKit

class WorkoutVC: UIViewController {
    
    @IBOutlet weak var beginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        beginButton.layer.cornerRadius = 10
        beginButton.clipsToBounds = true
        // Do any additional setup after loading the view.
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
