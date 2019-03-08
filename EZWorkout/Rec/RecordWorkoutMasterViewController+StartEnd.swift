

import UIKit
import RealmSwift

extension RecordWorkoutMasterViewController{
  
  func startWorkout(){
    if !isWorkingOut {
      print("start workout")
      isWorkingOut = true
      startDate = Date()
      workoutModel = WorkoutModel()
      workoutModel?.startTime = Date()
      exercises = [ExerciseModel]()
      createFeedbackMessage(topMsg: "Starting Workout", bottomMsg: "")
      startWorkoutTimer()
    }else{
      print("you are already working out")
      createFeedbackMessage(topMsg: "you are already working out", bottomMsg: "")
    }
  }
  
  func endWorkout(){
    if isWorkingOut {
      print("ending workout")
      createFeedbackMessage(topMsg: "Ending Workout", bottomMsg: "")
      isWorkingOut = false
      workoutModel?.endTime = Date()
      workoutModel?.exercises = exercises!
      save(workoutModel:workoutModel!)
      endWorkoutTimer()
    }else{
      print("you need to start a workout first")
      createFeedbackMessage(topMsg: "you need to start a workout first", bottomMsg: "")
    }
  }
  
  func save(workoutModel:WorkoutModel){
    let workoutRealm = RealmDataMangers.realmWorkout(workoutModel: workoutModel)
    let realm = try! Realm()
    try! realm.write {
      UserRealm.curUser.workoutArray.append(workoutRealm)
    }
    
  }
}
