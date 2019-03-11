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
    @objc dynamic var name: String!
    @objc dynamic var gender: String!
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
    
    func getAllTime()->[Date]{
        var workOut = [Date]()
        for item in workoutArray{
            let dateFromatter = DateFormatter()
            dateFromatter.dateFormat = "MM/dd/yyyy"
            print(dateFromatter.string(from: item.endTime!))
//            workOut = workOut + (item.endTime?.timeIntervalSince1970 - item.startTime?.timeIntervalSince1970)
        }
        return workOut
        
    }

 // func getAllTime()
  func getYearsWorkingOut()->[String]{
    //TODO do this on realm side
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy"
    
    var dateSet = Set<Date>()
    var yearsWorkingOut = [String]()
    
    for workout in workoutArray{
      if dateSet.contains(workout.startTime!){
        
      }else{
        //add to array and set
        dateSet.insert(workout.startTime!)
        yearsWorkingOut.append(dateFormatter.string(from: workout.startTime!))
      }
    }
    return yearsWorkingOut
  }
}
