

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
      exercisesByType = [[ExcerciseRealm]]()
      for exercise in workouts[index.row].excerciseArray{
        addExerciseByType(exercise:exercise , exercisTypeArray:exercisesByType!)
      }
      print("exerciseByType count is \(exercisesByType!.count)")
      exerciseTableView.reloadData()
      print("exercises by type = \(exercisesByType)")
    }
    
  }
  func addExerciseByType(exercise:ExcerciseRealm , exercisTypeArray:[[ExcerciseRealm]]){
    
    for var exerciseType in exercisTypeArray{
      
      if exercise.name! == exerciseType[0].name!{
        //if the type is the same, add it as a set
        exerciseType.append(exercise)
        return
      }
      
    }
    //if the type is not yet in the array, add a new entry
    //TODO check if ok to modify param
    exercisesByType?.append([exercise])
  }
  
  
  
}
