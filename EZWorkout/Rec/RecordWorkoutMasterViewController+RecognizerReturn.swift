
import UIKit

extension RecordWorkoutMasterViewController : RecognizerReturnDelegate {
  
  func recieveInProgress(speech: String) {
    feebBackLabel.text = speech
  }
  
  func recieve(speech: String) {
    print("speech recieved: \(speech)")
    
    //if working out, check exercises first
    
    //process for exercise data
    var exerciseModel = speechInputManager.findExercise(input: speech)
    if let exerciseModel = exerciseModel {
      print("found an exercise with the name \(exerciseModel.name)")
      if isWorkingOut{
        createExerciseView(exerciseModel: exerciseModel)
      }else{
        //TODO auto start workout
        createFeedbackMessage(topMsg: "you must start a workout first", bottomMsg: "")
      }
      
      return
    }
    
    
    //then check the commands
    let cmd = speechInputManager.findCommand(inputSpeech: speech)
    
    if let cmd = cmd{
      switch (cmd){
      case .StartWorkout:
        startWorkout()
      case .EndWorkout:
        endWorkout()
      case .Undo:
        Undo()
        
      }
    }else{
      print("did not understand command")
      createFeedbackMessage(topMsg: "did not understand command", bottomMsg: "\'\(speech)\'")
    }
    
    
  }
  
  
}
