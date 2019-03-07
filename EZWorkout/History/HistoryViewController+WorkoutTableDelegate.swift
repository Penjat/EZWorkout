

import UIKit

extension HistoryViewController : WorkoutTableManagerDelegate{
  
  func getWorkouts() -> [WorkoutRealm]{
    RealmDataMangers.retrieveUser()
    //TODO check if this is correct
    if let workouts = workouts {
      return workouts
    }
    return []
  }
  func getWorkout(indexPath:IndexPath)-> WorkoutRealm?{
    
    //TODO set up based on month
    if let workouts = workouts {
      return workouts[indexPath.row]
    }
    return nil
    
  }
  
  func workoutPressed(atIndex index:IndexPath){
    if let workouts = workouts  {
      
      curWorkout = workouts[index.row]
      //TODO check if different
      exercises = workouts[index.row].excerciseArray.map{$0}
      exerciseTableView.reloadData()
    }
    
  }
}
