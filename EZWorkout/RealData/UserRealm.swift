//
//  UserRealm.swift
//  EZWorkout
//
//  Created by Yilei Huang on 2019-03-05.
//  Copyright © 2019 Spencer Symington. All rights reserved.
//

import UIKit
import RealmSwift

class UserRealm: Object {
    static var curUser = UserRealm()
    @objc dynamic var name: String?
    @objc dynamic var gender: String?
    @objc dynamic var birthday: Date?
    
    let userStatArray = List<userStatRealm>()
    let workoutArray = List<WorkoutRealm>()
  
  func getAllExercises() -> [ExcerciseRealm]{
    
    var exercises = [ExcerciseRealm]()
    for workout in workoutArray{
      exercises = exercises + workout.excerciseArray
    }
    return exercises
  }
}
