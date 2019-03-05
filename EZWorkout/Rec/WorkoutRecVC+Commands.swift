

import Foundation

extension WorkoutRecVC {
  
  func startWorkout(){
    if !isWorkingOut {
      print("start workout")
      isWorkingOut = true
      startWorkoutTimer()
    }else{
      print("you are already working out")
    }
  }
  
  func endWorkout(){
    if isWorkingOut {
      print("ending workout")
      isWorkingOut = false
      endWorkoutTimer()
    }else{
      print("you need to start a workout first")
    }
  }
}
