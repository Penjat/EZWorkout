

import Foundation

class DataManager{
  
  static let dataManager = DataManager()
  
  var exercises = [ExerciseModel]()
  
  
  
  
  init() {
    
    
  }
  
  class func shared() -> DataManager {
    return dataManager
  }
  
  func createFakeExercises(){
    
  }
  
  func getAllExercises() -> [ExerciseModel]{
    
    return []
  }
  
  func testSingelton(){
    print("the singelton works")
  }
  
  
}

