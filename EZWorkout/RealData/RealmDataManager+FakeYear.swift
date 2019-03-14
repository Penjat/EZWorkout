
import Foundation
import RealmSwift

extension RealmDataMangers {
  
  
  static func createFakeYear(){
    print("creating fake year")
    let speechInputManager = SpeechInputManager()
    
    let realm = try! Realm()
    
    let startDate = Calendar.current.date(byAdding: .year, value: -1, to: Date())!
    
    for i in 0...365{
      let workoutTime = Int.random(in: 0..<40)+30
      //skip some days
      if Int.random(in: 0...7) > 0{
        let startTime = Calendar.current.date(byAdding: .day, value: i, to: startDate)!
        let endTime = Calendar.current.date(byAdding: .minute, value: workoutTime, to: startTime)
        
        let workoutModel = createFakeWorkout(speechInputManager:speechInputManager,day:i)
        workoutModel.startTime = startTime
        workoutModel.endTime = endTime
        
        let workoutRealm = RealmDataMangers.realmWorkout(workoutModel: workoutModel)
        
        try! realm.write {
          UserRealm.curUser.workoutArray.append(workoutRealm)
        }
      }
    }
    
  }
  static func createFakeWorkout(speechInputManager:SpeechInputManager, day:Int)->WorkoutModel{
    //speechInputManager.findExercise(input: speech)
    let workout = WorkoutModel()
    let exerciseCount = Int.random(in: 6 ... 20)
    for _ in 0..<exerciseCount{
      
        let exercise = createFakeExercise(speechInputManager:speechInputManager,day:day)
        workout.exercises.append(exercise)
      
    }
    
    
    return workout
  }
  
  static func createFakeExercise(speechInputManager:SpeechInputManager, day:Int)->ExerciseModel{
    let ref = speechInputManager.exerciseRefs.randomElement()
    
    let reps = Int.random(in: 3...14)
    let value = Int.random(in: 20...215) + Int(Double(day)*0.3)
    let exerciseModel = ExerciseModel(exerciseRef: ref, modifiers: [], reps: reps, value: value)
    
    return exerciseModel
  }
}
