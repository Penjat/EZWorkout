

import Foundation

extension RecordWorkoutMasterViewController : CenterViewProtocol  {
 
  
  func getExerciseArray() -> [ExerciseModel]{
    
    if let exercises = exercises{
      return exercises
    }
    return []
    
    
  }
  func getExercise(atIndex index:Int) -> ExerciseModel?{
    if let exercises = exercises {
      return exercises[index]
    }
    return nil
  }
  
  
  
}
