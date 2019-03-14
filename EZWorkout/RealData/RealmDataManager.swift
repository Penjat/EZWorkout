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
  
  static func realmExercisesFrom(exerciseModelArray:[ExerciseModel])->[ExcerciseRealm]{
    
    var realmExercises = [ExcerciseRealm]()
    
    for exerciseModel in exerciseModelArray{
      let realmExercise = RealmDataMangers.realmExerciseFrom(exerciseModel: exerciseModel)
      realmExercises.append(realmExercise)
    }
    
    return realmExercises
  }
  
  static func realmExerciseFrom(exerciseModel:ExerciseModel)->ExcerciseRealm{
    
//TODO check the '!'
    let cal = 0
    let type = exerciseModel.exerciseRef!.exerciseType.toString()
    let name = exerciseModel.exerciseRef!.getName()
    let modified = ""
    let reps = exerciseModel.reps != nil ? exerciseModel.reps! : -1
    let weight: Int = exerciseModel.value != nil ? exerciseModel.value! : -1
    
    //TODO careful of force unwraps
    return createExcercise(calory: cal, type: type, name: name, modified: modified, reps: reps, weight: weight)
    
  }
    static func retrieveUser(){
        let realm = try! Realm()
        if let results = realm.objects(UserRealm.self).first{
            UserRealm.curUser = results
        }else{
//            let realm = try! Realm()
//            let firstExcerise = RealmDataMangers.createExcercise(calory: 10, type: "weight", name: "bench", modified: "incline", reps: 20, weight: 40)
//            let second = RealmDataMangers.createExcercise(calory: 10, type: "weight", name: "benchpress", modified: "incline", reps: 20, weight: 40)
//            let second1 = RealmDataMangers.createExcercise(calory: 10, type: "weight", name: "swimming", modified: "incline", reps: 20, weight: 40)
//            let second2 = RealmDataMangers.createExcercise(calory: 10, type: "weight", name: "weight", modified: "incline", reps: 20, weight: 40)
//            let second3 = RealmDataMangers.createExcercise(calory: 10, type: "weight", name: "barbell", modified: "incline", reps: 20, weight: 40)
//            let second4 = RealmDataMangers.createExcercise(calory: 10, type: "weight", name: "weight", modified: "incline", reps: 20, weight: 40)
//            let second5 = RealmDataMangers.createExcercise(calory: 10, type: "weight", name: "barbell", modified: "incline", reps: 20, weight: 40)
//            let second6 = RealmDataMangers.createExcercise(calory: 10, type: "weight", name: "weight", modified: "incline", reps: 20, weight: 40)
//            let second7 = RealmDataMangers.createExcercise(calory: 10, type: "weight", name: "barbell", modified: "incline", reps: 20, weight: 40)
//            let second8 = RealmDataMangers.createExcercise(calory: 10, type: "weight", name: "swimming", modified: "incline", reps: 20, weight: 40)
//            let second9 = RealmDataMangers.createExcercise(calory: 10, type: "weight", name: "barbell", modified: "incline", reps: 20, weight: 40)
//            let formatter = DateFormatter()
//
//
//
//            formatter.dateFormat = "d MMM yyyy HH:mm:ss"
//            let someDateTime1S = formatter.date(from: "12 Mar 2019 20:58:22")
//            let someDateTime1E = formatter.date(from: "12 Mar 2019 21:58:22")
//
//            let someDateTime2S = formatter.date(from: "11 Feb 2019 12:58:22")
//            let someDateTime2e = formatter.date(from: "11 Feb 2019 13:58:22")
//            let someDateTime3S = formatter.date(from: "07 Mar 2019 14:01:22")
//            let someDateTime3e = formatter.date(from: "07 Mar 2019 14:58:22")
//            let someDateTime4S = formatter.date(from: "03 Jan 2019 11:12:22")
//            let someDateTime4e = formatter.date(from: "03 Jan 2019 11:40:22")
//            let someDateTime5S = formatter.date(from: "22 Jan 2019 15:58:22")
//            let someDateTime5e = formatter.date(from: "22 Jan 2019 16:50:22")
//            let workout = RealmDataMangers.createWorkout(endTime: Date(), startTime: Date(), location: "Light-house", excerciseArray: [firstExcerise,second,second1])
//
//            let workout2 = RealmDataMangers.createWorkout(endTime: someDateTime2e!, startTime: someDateTime2S!, location: "Light-house", excerciseArray: [second2,second3,second4])
//
//            let workout3 = RealmDataMangers.createWorkout(endTime: someDateTime3e!, startTime: someDateTime3S!, location: "Light-house", excerciseArray: [second5,second6])
//
//            let workout4 = RealmDataMangers.createWorkout(endTime: someDateTime4e!, startTime: someDateTime4S!, location: "Light-house", excerciseArray: [second7,second1])
//
//            let workout5 = RealmDataMangers.createWorkout(endTime: someDateTime5e!, startTime: someDateTime5S!, location: "Light-house", excerciseArray: [second2,firstExcerise])
//
////
//            let userSat =  RealmDataMangers.createUserStat(date: someDateTime2S!, weight: 120, restingHeart: 60)
//
//            let userSat2 =  RealmDataMangers.createUserStat(date: someDateTime3e!, weight: 123, restingHeart: 65)
//
//            let userSat3 =  RealmDataMangers.createUserStat(date: someDateTime4e!, weight: 140, restingHeart: 73)
            let user = RealmDataMangers.createUser(name: "Jason", gender: "male", Date: Date(), userStatArray: [], workoutArray: [])
            RealmDataMangers.save(object: user, realm: realm)
            UserRealm.curUser = realm.objects(UserRealm.self).first!
          
          
          createFakeYear()
          
        }
        
    }
    
    

    
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
  static func realmWorkout(workoutModel:WorkoutModel)->WorkoutRealm{
    
    let startTime = workoutModel.startTime!
    let endTime = workoutModel.endTime!
    let location = ""
    let realmExercises = RealmDataMangers.realmExercisesFrom(exerciseModelArray: workoutModel.exercises)
    
    return RealmDataMangers.createWorkout(endTime: endTime, startTime: startTime, location: location, excerciseArray: realmExercises)
  }
    static func createUserStat(date:Date, weight:Int, restingHeart: Int?)->userStatRealm{
    return userStatRealm(value:[date,weight,restingHeart])
  }
  
  static func createUser(name:String,gender:String,Date:Date,userStatArray:[userStatRealm],workoutArray:[WorkoutRealm])->UserRealm{
    return UserRealm(value:[name,gender,Date,userStatArray,workoutArray])
  }
  
  
  
  
  static func retrieveExcercise(workoutNum:Int,excersierNum:Int,realm:Realm)->ExcerciseRealm{
    let results = realm.objects(UserRealm.self).first!
    return results.workoutArray[workoutNum].excerciseArray[excersierNum]
  }
  // static func save()
}


  

