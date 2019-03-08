//
//  RealmDataManager.swift
//  EZWorkout
//
//  Created by Yilei Huang on 2019-03-05.
//  Copyright © 2019 Spencer Symington. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift


class RealmDataMangers {
    static func createExcercise(calory:Int, type:String, name:String, modified:String, reps:Int, weight:Int)->ExcerciseRealm{
        return ExcerciseRealm(value:[calory,weight,type,name,modified,reps])
    }
    static func save(object:Object, realm:Realm){
        try! realm.write {
            realm.add(object)
        }
        print(Realm.Configuration.defaultConfiguration.fileURL!)
    }
    static func createWorkout(endTime:Date, startTime:Date, location: String?, excerciseArray: [ExcerciseRealm])->WorkoutRealm{
       // let realm = try! Realm()
        return WorkoutRealm(value:[endTime,startTime,location,excerciseArray])
    }
    
    static func createUserStat(date:Date, weight:Int)->userStatRealm{
        return userStatRealm(value:[date,weight])
    }
    
    static func createUser(name:String,gender:String,Date:Date,userStatArray:[userStatRealm],workoutArray:[WorkoutRealm])->UserRealm{
        return UserRealm(value:[name,gender,Date,userStatArray,workoutArray])
    }
    
    
    static func retrieveUser(){
        let realm = try! Realm()
        let results = realm.objects(UserRealm.self).filter("name == 'Jason'").first!
        UserRealm.curUser = results
        
    }
    
    static func retrieveExcercise(workoutNum:Int,excersierNum:Int,realm:Realm)->ExcerciseRealm{
        let results = realm.objects(UserRealm.self).first!
        return results.workoutArray[workoutNum].excerciseArray[excersierNum]
    }
   // static func save()
}


class RealmDataManger: UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        RealmDataMangers.retrieveUser()
         let realm = try! Realm()
        let firstExcerise = RealmDataMangers.createExcercise(calory: 10, type: "bodyweight", name: "bench", modified: "incline", reps: 20, weight: 40)
      let workout = RealmDataMangers.createWorkout(endTime: Date(), startTime: Date(), location: "Light-house", excerciseArray: [firstExcerise,firstExcerise])
      let userSat =  RealmDataMangers.createUserStat(date: Date(), weight: 120)
      let user = RealmDataMangers.createUser(name: "Zoe", gender: "female", Date: Date(), userStatArray: [userSat,userSat], workoutArray: [workout,workout])
      RealmDataMangers.save(object: user, realm: realm)
//        print(RealmDataMangers.retrieveExcercise(workoutNum: 0, excersierNum: 0, realm: realm))
//        print(UserRealm.curUser.workoutArray[0].excerciseArray[0])
//        print(Realm.Configuration.defaultConfiguration.fileURL!)
    }
    
    
}
