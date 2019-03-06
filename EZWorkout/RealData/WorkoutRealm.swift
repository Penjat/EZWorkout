//
//  Excercise.swift
//  EZWorkout
//
//  Created by Yilei Huang on 2019-03-05.
//  Copyright © 2019 Spencer Symington. All rights reserved.
//

import UIKit
import RealmSwift

class WorkoutRealm: Object {
    @objc dynamic var endTime: Date?
    @objc dynamic var startTime: Date?
    @objc dynamic var location: String?
    let excerciseArray = List<ExcerciseRealm>()
    
}
