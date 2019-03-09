

import Foundation
extension SpeechInputManager{
  
  //TODO may need to make command delegate
  //TODO pass in some status info, if someone says workout it should probably start a workout
  func findCommand(inputSpeech:String) -> SpeechCommand?{
    let cleanInput = sanitize(input: inputSpeech)
    print("clean input = \(cleanInput)")
    //TODO expand with more commands
    
    if cleanInput.contains("startwork"){
      return SpeechCommand.StartWorkout
    }
    
    if (cleanInput.contains("endwork") || cleanInput.contains("andwork") || cleanInput.contains("finishworkout")) {
      return SpeechCommand.EndWorkout
    }
    
    if (cleanInput.contains("undo")  ) {
      return SpeechCommand.Undo
    }
    
    return nil
  }
}

enum SpeechCommand{
  case StartWorkout,EndWorkout,Undo
}
