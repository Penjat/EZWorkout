

import Foundation

extension WorkoutRecVC : RecognizerReturnDelegate {
  
  func recieve(speech: String) {
    print("speech recieved: \(speech)")
    
    //if working out, check exercises first
    if isWorkingOut{
      //process for exercise data
      var exerciseModel = speechInputManager.findExercise(input: speech)
      if let exerciseModel = exerciseModel {
        print("found an exercise with the name \(exerciseModel.name)")
        createExerciseView(exerciseModel: exerciseModel)
      }
    }
    
    //then check the commands
    let cmd = speechInputManager.findCommand(inputSpeech: speech)
    
    if let cmd = cmd{
      switch (cmd){
      case .StartWorkout:
        startWorkout()
      case .EndWorkout:
        endWorkout()
      }
    }else{
      print("did not understand command")
    }
    
    
  }
  
  
}
