

import Foundation

enum ExerciseType{
  case BodyWeight,Weight,Distance,Timed
  
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
      
    }
  }
}
