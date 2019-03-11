

import Foundation
extension SpeechInputManager{
  
  //TODO may need to make command delegate
  //TODO pass in some status info, if someone says workout it should probably start a workout
  
  
  
  func findCommand(inputSpeech:String) -> SpeechCommand?{
    
    
    let cleanInput = sanitize(input: inputSpeech)
    
    //check all the commands
    for command in commands{
      //search if input triggers any commands
      if command.checkMatch(input: cleanInput){
        
        //return what to do if found
        return command.speechCommand
      }
    }
    
    //return nil if none found
    return nil
  }
}

enum SpeechCommand{
  case StartWorkout,EndWorkout,Undo
}
