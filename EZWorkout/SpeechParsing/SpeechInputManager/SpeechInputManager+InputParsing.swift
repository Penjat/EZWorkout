

import Foundation


extension SpeechInputManager{
  
  
  func checkForExercise(inputString:String) -> ExerciseRefernce?{
    
    //check the user added exercises first
    for ref in userAddedExerciseRefs{
      if(ref.checkMatches(input: inputString)){
        //TODO check prefixes and postfixes
        
        return ref
      }
    }
    
    for ref in exerciseRefs{
      if(ref.checkMatches(input: inputString)){
        //TODO check prefixes and postfixes
        
        return ref
      }
    }
    
    
    return nil
  }
  
  func sanitize(input:String) -> String {
    
    var output = input.lowercased()
    for element in numberDictionary {
      output = output.replacingOccurrences(of: element.key, with: element.value)
    }
    output = output.removingWhitespaces()
    output = output.removingPunctuation()
    
    
    return output
    
  }
  
  func checkForModifiers(inputString:String , exerciseRef:ExerciseRefernce?) -> [ExerciseModifier]{
    
    var modifiers = [ExerciseModifier]()
    
    for modifier in self.exerciseModifiers{
      if inputString.contains(modifier.searchName){
        
        //make sure the modifier is not redundant (already in the exercise name)
        if let exerciseRef = exerciseRef, exerciseRef.checkRedunant(modifier: modifier){
          
        }else{
          modifiers.append(modifier)
        }
        
      }
    }
    return modifiers
  }
  func findAllNumbers(inputString:String) -> [Int]{
    
    let stringNumberArray = inputString.components(separatedBy: CharacterSet.decimalDigits.inverted)
    var numberArray = [Int]()
    var i = 0
    for item in stringNumberArray {
      if let number = Int(item) {
        //print("number: \(number)")
        numberArray.append(number)
        print("number found at \(i)")
      }
      i += 1
    }
    numberArray = setValueRepOrder(inputString: inputString , numberArray:numberArray)
    return numberArray
  }
  
  func setValueRepOrder(inputString:String , numberArray:[Int]) -> [Int]{
    let outputArray = numberArray
    let valueIndex = positionInString(posibleTerms: ["pound","k"] , inputString: inputString)
    
    let repIndex = positionInString(posibleTerms: ["rep","min"] , inputString: inputString)
    
    if let repIndex = repIndex , let valueIndex = valueIndex{
      if repIndex < valueIndex{
        //if the reps came first
        print("reversing")
        return outputArray.reversed()
      }else{
        print("not reversing")
      }
    }else{
      print("couldn't find both reps and pounds")
    }
    
   return outputArray
  }
  func positionInString(posibleTerms:[String] , inputString: String )->Int?{
    
    for searchTerm in posibleTerms{
      if let range: Range<String.Index> = inputString.range(of: searchTerm){
        let index: Int = inputString.distance(from: inputString.startIndex, to: range.lowerBound)
        return index
      }
    }
    return nil
    
  }
  
  func calculateReps(numbers:[Int] , exerciseRef:ExerciseRefernce?) -> Int?{
    //TODO check if bodyweight or time exercise
    
    //if there we found an exercise, use that to determin what we need
    if let exerciseRef = exerciseRef{
      switch(exerciseRef.exerciseType){
        
      case .BodyWeight:
        if numbers.count > 0{
          return numbers[0]
        }
        return nil
        
      case .Weight:
        if numbers.count > 1{
          return numbers[1]
        }
        return nil
      
      case .TimedDistance:
        if numbers.count > 1{
          return numbers[1]
        }
        return nil
        
      case .Distance:
        if numbers.count > 0{
          return numbers[0]
        }
        return nil
      case .Timed:
        if numbers.count > 0{
          return numbers[0]
        }
      }
      
    }
    
    //if no exercise, 1st is weight, second is reps
    //TODO check for key words
    if numbers.count > 1{
      return numbers[1]
    }
    
    
    return nil
  }
  func calculateWeight(numbers:[Int] , exerciseRef:ExerciseRefernce?) -> Int?{
    //TODO check if bodyweight or time exercise
    
    //if there we found an exercise, use that to determin what we need
    if let exerciseRef = exerciseRef{
      switch(exerciseRef.exerciseType){
        
      case .BodyWeight:
        
        return nil
        
      case .Weight:
        if numbers.count > 0{
          return numbers[0]
        }
        return nil
        
      case .TimedDistance:
        if numbers.count > 0{
          return numbers[0]
        }
        return nil
        
      case .Distance:
        if numbers.count > 0{
          return numbers[0]
        }
        return nil
      case .Timed:
        if numbers.count > 0{
          return numbers[0]
        }
      }
      
    }
    
    //if no exercise, 1st is weight, second is reps
    //TODO check for key words
    if numbers.count > 0{
      return numbers[0]
    }
    return nil
  }
  
  func findExercise(input:String) -> ExerciseModel?{
    let cleanInput = sanitize(input: input)
    
    let exerciseRef = checkForExercise(inputString: cleanInput)
    
    //posibly don't return anything if couldn't guess the exercise
    if exerciseRef == nil {
      return nil
    }
    
    let numbers = findAllNumbers(inputString: cleanInput)
    
    let reps = calculateReps(numbers: numbers, exerciseRef: exerciseRef)
    let weight = calculateWeight(numbers: numbers, exerciseRef: exerciseRef)
    let modifiers = checkForModifiers(inputString: cleanInput, exerciseRef: exerciseRef)
    
    let exerciseModel = ExerciseModel(exerciseRef: exerciseRef, modifiers: modifiers, reps: reps, value: weight)
    
    
    
    return exerciseModel
    
  }
}

extension String {
  
  func removingWhitespaces() -> String {
    return components(separatedBy: .whitespaces).joined()
  }
  func removingPunctuation() -> String {
    return components(separatedBy: .punctuationCharacters).joined()
  }
}


