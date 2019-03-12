
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
      let workouts = realm.objects(WorkoutRealm.self).filter("startTime < %@", date)
      
      
      for workout in workouts{
        output += getWeight(exercises: workout.excerciseArray )
      }
    }else{
      let exercises = realm.objects(ExcerciseRealm.self).filter("type = %@", "weight")
      
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
  static func getTotalTime(beforeDate:Date)->Int{
    let realm = try! Realm()
    let workouts = realm.objects(WorkoutRealm.self).filter("startTime <= %@", beforeDate)
    var time = 0.0
    for workout in workouts{
      if let startTime = workout.startTime , let endTime = workout.endTime{
        time += endTime.timeIntervalSince(startTime)
      }
      
    }
    return Int(time)
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
  
  static func getTotalReps(date:Date)->Int{
    let realm = try! Realm()
    let workouts = realm.objects(WorkoutRealm.self).filter("startTime < %@", date)
    var reps = 0
    for workout in workouts{
      let exercises = workout.excerciseArray.filter("type == 'weight' OR type == 'bodyweight' ")
      for exercise in exercises{
        if exercise.reps > 0{
          reps += exercise.reps
        }
      }
    }
    
    return reps
    
  }
  
  static func getTotalReps()->Int{
    let realm = try! Realm()
    let exercises = realm.objects(ExcerciseRealm.self).filter("type == 'weight' OR type == 'bodyweight' ")
    
    return getRepsFrom(exercises: exercises)
    
  }
  static func getRepsFrom(exercises:Results<ExcerciseRealm>)->Int{
    var reps = 0
    for exercise in exercises{
      if exercise.reps > 0{
        reps += exercise.reps
      }
      
    }
    return reps
  }
  
  
  
  static func getCal(date:Date?)->Int{
    
    //get the total weight lifted since date
    let weightPounds = getTotalWeight(beforeDate: date)
    let weightKG : Double = Double(weightPounds)*2.2
    
    //estimate the distance moved to be half a meter
    let joules = weightKG*0.5
    
    let cals = joules/4.184
    //TODO maybe return a double
    return Int(cals)
  }
  
}

