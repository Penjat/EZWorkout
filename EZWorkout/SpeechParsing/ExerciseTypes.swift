

import Foundation

enum ExerciseType{
  case BodyWeight,Weight,Distance,Timed,TimedDistance
  
  func toString()->String{
    
    switch(self){
    case .BodyWeight:
      return "bodyweight"
      
    case .Weight:
      return "weight"
      
    case .Distance:
      return "distance"
      
    case .Timed:
      return "timed"
    case .TimedDistance:
      return "timedDistance"
      
    }
  }
  
  static func exerciseType(string:String)->ExerciseType{
    switch(string){
    case "bodyweight":
      return .BodyWeight
      
    case "weight":
      return .Weight
      
    case "distance":
      return .Distance
      
    case "timed":
      return .Timed
      
    case "timedDistance":
      return .TimedDistance
    default:
      return .Weight
    }
    
  }
}
