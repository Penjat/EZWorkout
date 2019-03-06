
import UIKit

protocol CenterViewProtocol{
  
  func getExerciseArray() -> [ExerciseModel]
  func getExercise(atIndex index:Int) -> ExerciseModel?
}
