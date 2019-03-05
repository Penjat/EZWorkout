

import Foundation

struct ExerciseModifier {
  let returnName: String
  let searchName: String //should it be a string array?
  let modifierType: ModifierType
  
  
}

enum ModifierType{
  case Prefix,Postfix
}
