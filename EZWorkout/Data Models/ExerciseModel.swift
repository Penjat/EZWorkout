

import Foundation

//will be replaced by the Exercise class in core data
//contains the data for an exercise a user completed

struct ExerciseModel{
  
  
  
  let exerciseRef: ExerciseRefernce?
  let modifiers: [ExerciseModifier]?
  var reps: Int? = nil
  var value: Int? = nil
  
  var name: String{
    var output = ""
    
    if let exerciseRef = exerciseRef{
      output = exerciseRef.getName()
    }
    if let modifiers = modifiers{
      for modifier in modifiers{
        if modifier.modifierType == .Prefix {
          output = "\(modifier.returnName) \(output)"
        }else{
          output = "\(output) \(modifier.returnName)"
        }
      }
    }
    
    
    return output
    
  }
}
