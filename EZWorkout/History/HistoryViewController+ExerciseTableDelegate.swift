
import UIKit

extension HistoryViewController : ExerciseTableManagerDelegate{
  
  func getExercises() -> [ExcerciseRealm]{
    
    if let exercises = exercises {
      return exercises
    }
    return []
  }
}
