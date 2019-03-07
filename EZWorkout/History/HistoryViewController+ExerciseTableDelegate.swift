
import UIKit

extension HistoryViewController : ExerciseTableManagerDelegate{
  
  
  
  func getExercisesByType() -> [[ExcerciseRealm]]{
    
    if let exercises = exercisesByType {
      return exercises
    }
    return []
  }
  func getExercise(indexPath:IndexPath)->ExcerciseRealm{
    return exercisesByType![indexPath.section][indexPath.row]
  }
}
