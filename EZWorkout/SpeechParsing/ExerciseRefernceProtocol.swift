

import Foundation

protocol ExerciseRefernce {
  var exerciseType: ExerciseType {get set}
  
  
  func checkMatches(input:String) -> Bool
  func getName() -> String
  func checkRedunant(modifier:ExerciseModifier) -> Bool
}
