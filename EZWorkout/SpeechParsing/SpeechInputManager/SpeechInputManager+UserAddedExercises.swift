

import Foundation

extension SpeechInputManager {
  
  func addUserExerciseRef(name:String , type:ExerciseType , muscleGroups: [MuscleGroup]){
    
    //remove punctiuation and whitespace from name
    let searchName = name.removingWhitespaces().removingPunctuation()
    
    
    userAddedExerciseRefs.append(ExerciseRef(name: searchName,muscleGroups: [MuscleGroup.Chest],exerciseType: ExerciseType.Weight , outputName:name ))
   
  }
  
 
}
