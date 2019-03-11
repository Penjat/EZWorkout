
import UIKit

protocol CenterViewProtocol{
  
  func getExerciseArray() -> [ExerciseModel]
  func getExercise(atIndex index:Int) -> ExerciseModel?
  
  func recPressed()
  func recReleased()
  func getStartDate()->Date
  
}
