
import Foundation
import RealmSwift

extension StaticDataManager{
  
  
  
  static func getRealmDataGroupedbyWeight(startDate:Date? , endDate:Date?)->[String:Int]{
    
    let realm = try! Realm()
    var results = [ExcerciseRealm]()
    
    //if there is a date, get the exercsise between them
    if let startDate = startDate , let endDate = endDate {
      let workouts = realm.objects(WorkoutRealm.self).filter("startTime BETWEEN %@", [startDate, endDate])
      for workout in workouts{
        results = results + workout.excerciseArray.map{$0}
      }
    }else{
      //if no date, get all exercises
      results = realm.objects(ExcerciseRealm.self).filter("type = %@", "weight").map{$0}
    }
    
    
    var emptyDict = [String:Int]()
    
    //loop through all the results
    for item in results{
      
      //check if they are weight and legit value
      if item.type == "weight" , let weight = item.weight.value , weight != -1 {
        if emptyDict.index(forKey: item.name!) == nil {
          emptyDict[item.name!] = weight
        } else{
          let num = emptyDict[item.name!]
          emptyDict.updateValue(num!+weight, forKey: item.name!)
        }
        
      }
      
    }
    return emptyDict
  }
  static func getRealmDataGroupedbyReps(startDate:Date? , endDate:Date?)->[String:Int]{
    
    let realm = try! Realm()
    var results = [ExcerciseRealm]()
    
    //if there is a date, get the exercsise between them
    if let startDate = startDate , let endDate = endDate {
      let workouts = realm.objects(WorkoutRealm.self).filter("startTime BETWEEN %@", [startDate, endDate])
      for workout in workouts{
        results = results + workout.excerciseArray.map{$0}
      }
    }else{
      //if no date, get all exercises
      results = realm.objects(ExcerciseRealm.self).filter("type = %@", "weight").map{$0}
    }
    
    
    var emptyDict = [String:Int]()
    
    //loop through all the results
    for item in results{
      
      //check if they are weight and legit value
      if item.type == "weight" ,   item.reps > 0 {
        if emptyDict.index(forKey: item.name!) == nil {
          emptyDict[item.name!] = item.reps
        } else{
          let num = emptyDict[item.name!]
          emptyDict.updateValue(num!+item.reps, forKey: item.name!)
        }
        
      }
      
    }
    return emptyDict
  }
  
  static func getRealmDataGroupedbySets(startDate:Date? , endDate:Date?)->[String:Int]{
    
    let realm = try! Realm()
    var results = [ExcerciseRealm]()
    
    //if there is a date, get the exercsise between them
    if let startDate = startDate , let endDate = endDate {
      let workouts = realm.objects(WorkoutRealm.self).filter("startTime BETWEEN %@", [startDate, endDate])
      for workout in workouts{
        results = results + workout.excerciseArray.map{$0}
      }
    }else{
      //if no date, get all exercises
      results = realm.objects(ExcerciseRealm.self).map{$0}
    }
    
    
    var emptyDict = [String:Int]()
    
    //loop through all the results
    for item in results{
      
      //check if they are weight and legit value
      
      if emptyDict.index(forKey: item.name!) == nil {
        emptyDict[item.name!] = 1
      } else{
        let num = emptyDict[item.name!]
        emptyDict.updateValue(num!+1, forKey: item.name!)
      }
      
    }
    return emptyDict
  }
  
  static func getTotalWeight(beforeDate date:Date? = nil )->Int {
    let realm = try! Realm()
    let startDate = Date.init(timeIntervalSinceNow: 0)
    
    var output = 0
    
    if let date = date{
      let workouts = realm.objects(WorkoutRealm.self).filter("startTime BETWEEN %@", [startDate, date])
      
      
      for workout in workouts{
        output += getWeight(exercises: workout.excerciseArray )
      }
    }else{
      let exercises = realm.objects(ExcerciseRealm.self).filter("type = %@", "weight")
      print("the exercises with a weight over 200 are \(exercises.filter("weight > 0"))")
      output += getWeight(exercises: exercises )
      
    }
    
    return output
  }
  
  static func getWeight(exercises:Results<ExcerciseRealm>)->Int{
    var output = 0
    for exercise in exercises{
      if exercise.type == "weight", let weight = exercise.weight.value, weight > 0 ,exercise.reps > 0{
        output += weight*exercise.reps
        
      }
    }
    return output
  }
  static func getWeight(exercises:List<ExcerciseRealm>)->Int{
    var output = 0
    for exercise in exercises{
      if exercise.type == "weight", let weight = exercise.weight.value, weight > 0 ,exercise.reps > 0{
        output += weight*exercise.reps
        
      }
    }
    return output
  }
  
  static func getTotalTime()->Double{
    let realm = try! Realm()
    let workouts = realm.objects(WorkoutRealm.self)
    var time = 0.0
    for workout in workouts{
      if let startTime = workout.startTime , let endTime = workout.endTime{
        time += endTime.timeIntervalSince(startTime)
      }
      
    }
    return time
  }
  
}

