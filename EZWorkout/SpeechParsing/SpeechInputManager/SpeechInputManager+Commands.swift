

import Foundation
extension SpeechInputManager{
  
  //TODO may need to make command delegate
  func findCommand(inputSpeech:String) -> SpeechCommand?{
    let cleanInput = sanitize(input: inputSpeech)
    print("clean input = \(cleanInput)")
    //TODO expand with more commands
    if cleanInput.contains("startworkout"){
      return SpeechCommand.StartWorkout
    }
    if cleanInput.contains("endworkout") || cleanInput.contains("finishworkout") {
      return SpeechCommand.EndWorkout
    }
    return nil
  }
}

enum SpeechCommand{
  case StartWorkout,EndWorkout
}
