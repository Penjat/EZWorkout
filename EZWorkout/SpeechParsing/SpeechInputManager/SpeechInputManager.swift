

import Foundation

class SpeechInputManager {
  
  let numberDictionary = ["one":"1","two":"2","three":"3","four":"4","five":"5","six":"6","seven":"7","eight":"8","nine":"9","zero":"0"]
  
  var userAddedExerciseRefs = [ExerciseRefernce]()
  var exerciseRefs = [ExerciseRefernce]()
  var exerciseModifiers = [ExerciseModifier]()
  
  var commands = [CommandModel]()
  
  init() {
    
    setUpExerciseRefs()
    setUpModifiers()
    setUpCommands()
    print("exercise ref count = \(exerciseRefs.count)")
    print("modifier count = \(exerciseModifiers.count)")
  }
  
}
