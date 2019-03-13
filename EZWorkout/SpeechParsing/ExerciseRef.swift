

import Foundation


//is part of the data model used for determining which exercise the user is trying to log
//prefixes and postfixes refer to varriations on an exercise. For example 'inclined bench press'

struct ExerciseRef : ExerciseRefernce{
  
  
  
  let name: String
  let muscleGroups: [MuscleGroup]
  var exerciseType: ExerciseType
  let outputName: String
  
  init(name:String , muscleGroups: [MuscleGroup] , exerciseType:ExerciseType , outputName:String = "") {
    self.name = name
    self.muscleGroups = muscleGroups
    self.exerciseType = exerciseType
    
    //if no output name provided, make it the same as name
    if outputName == ""{
      self.outputName = name
    }else{
      self.outputName = outputName
    }
  }
  
  func checkMatches(input:String) -> Bool{
    
    return input.contains(name)
      
    
  }
  func getName() -> String {
    return name
  }
  func getOutputName() -> String{
    return outputName
  }
  
  func checkRedunant(modifier:ExerciseModifier) -> Bool{
    return name.contains(modifier.searchName)
  }
}
