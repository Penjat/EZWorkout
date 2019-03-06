

import Foundation

extension RecordWorkoutMasterViewController : CenterViewProtocol  {
 
  
  func getExerciseArray() -> [ExerciseModel]{
    
    if let exercises = exercises{
      return exercises
    }
    return []
    
    
  }
  
  
  
}
