

import UIKit
import RealmSwift

class HistoryViewController: UIViewController {
  
  @IBOutlet weak var exerciseTableView: UITableView!
  @IBOutlet weak var workoutTableView: UITableView!
  
  var workouts : [WorkoutRealm]?
  var curWorkout: WorkoutRealm?
  
  @IBOutlet weak var dateLabel: UILabel!
  @IBOutlet weak var startEndLabel: UILabel!
  @IBOutlet weak var timeSpentLabel: UILabel!
  
  let dateFormater = DateFormatter()
  let timeFormater = DateFormatter()
  
  //and array of exercises orginized by type with the array showing each set
  var exercisesByType: [[ExcerciseRealm]]?
  
  //Table Managers
  var exerciseTableManager: ExerciseTableManager!
  var workoutTableManager: WorkoutTableManager!
  
  @IBOutlet weak var monthYearPicker: UIPickerView!
  var years = ["2017","2018","2019"]
  let months = ["January","Febrary","March","April","May","June","July","August","September","October","November","December"]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    //declare self the delegate of the to table managers
    workoutTableManager = WorkoutTableManager(delegate: self)
    exerciseTableManager = ExerciseTableManager(delegate: self)
    
    //picker controllers
    //TODO get the years the user worked out
    
    
    //testRealm()
    //get the user
    RealmDataMangers.retrieveUser()
    workouts = UserRealm.curUser.workoutArray.map{$0}
    
    //get the years the user has been working out
    years = UserRealm.curUser.getYearsWorkingOut()
    
    //set the delegate for exercises table
    exerciseTableView.delegate = exerciseTableManager
    exerciseTableView.dataSource = exerciseTableManager
    
    //set the delegate for the workout table
    workoutTableView.delegate = workoutTableManager
    workoutTableView.dataSource = workoutTableManager
    
    exerciseTableView.sectionHeaderHeight = 80
    
    //Date formatters
    //TODO maybe create when needed
    //dateFormater.dateFormat = "d"
    dateFormater.dateStyle = .medium
    timeFormater.dateFormat = "h:mm"
    //timeFormater.timeStyle = .short
 
    monthYearPicker.delegate = self
    monthYearPicker.dataSource = self
    
    
  }
  
  func updateWorkoutLabels(){
    if let workout = curWorkout{
      dateLabel.text = dateFormater.string(from: workout.startTime!)
      let startTime = timeFormater.string(from: workout.startTime!)
      let endTime = timeFormater.string(from: workout.endTime!)
      startEndLabel.text = "\(startTime) - \(endTime)"
      
      timeSpentLabel.text = "\(workout.startTime!.timeIntervalSince(workout.endTime!)) hours"
    }
  }
  
  
  func testRealm(){
    let realm = try! Realm()
    
    RealmDataMangers.retrieveUser()
    
    
    
    
    let exercise2 = RealmDataMangers.createExcercise(calory: 4, type: "Bodyweight", name: "legpress", modified: "", reps: 10, weight: 100)
    
    let exercise1 = RealmDataMangers.createExcercise(calory: 2, type: "Bodyweight", name: "benchpress", modified: "", reps: 12, weight: 66)
    
    let workout = RealmDataMangers.createWorkout(endTime: Date(), startTime: Date(), location: "here", excerciseArray: [exercise1,exercise2])
    try! realm.write {
      UserRealm.curUser.workoutArray.append(workout)
    }
    
    
  }
  
  
  
  
}
