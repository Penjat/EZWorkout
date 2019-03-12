
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
      let workouts = realm.objects(ExcerciseRealm.self).filter("type = %@", "weight")
    }
    
    var emptyDict = [String:Int]()
    
    //loop through all the results
    for item in results{
      
      //check if they are weight and legit value
      if item.type == "weight" , let weight = item.weight.value , weight != -1 {
        if emptyDict.index(forKey: item.name!) == nil {
          emptyDict[item.name!] = 1
        } else{
          let num = emptyDict[item.name!]
          emptyDict.updateValue(num!+1, forKey: item.name!)
        }
        
      }
      
    }
    return emptyDict
  }
  
}

