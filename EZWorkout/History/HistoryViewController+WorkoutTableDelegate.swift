

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
}
