//
//  Excercise.swift
//  EZWorkout
//
//  Created by Yilei Huang on 2019-03-05.
//  Copyright © 2019 Spencer Symington. All rights reserved.
//

import UIKit
import RealmSwift

class ExcerciseRealm: Object {
    @objc dynamic var calory = 0
    
    @objc dynamic var type: String?
    @objc dynamic var name: String?
    @objc dynamic var reps = 0
   
}
