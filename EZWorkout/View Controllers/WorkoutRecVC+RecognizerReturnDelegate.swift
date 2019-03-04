

import Foundation

extension WorkoutRecVC : RecognizerReturnDelegate {
  func recieve(speech: String) {
    print("speech recieved: \(speech)")
    var exerciseModel = speechInputManager.findExercise(input: speech)
    if let exerciseModel = exerciseModel {
      print("found an exercise with the name \(exerciseModel.name)")
    }
  }
  
  
}
