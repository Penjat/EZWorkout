

import UIKit

class HistoryViewController: UIViewController {
  
  @IBOutlet weak var exerciseTableView: UITableView!
  @IBOutlet weak var workoutTableView: UITableView!
  
  var workouts : [WorkoutRealm]?
  var curWorkout: WorkoutRealm?
  var exercises: [ExcerciseRealm]?
  
  var exerciseTableManager: ExerciseTableManager!
  var workoutTableManager: WorkoutTableManager!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    //declare self the delegate of the to table managers
    workoutTableManager = WorkoutTableManager(delegate: self)
    exerciseTableManager = ExerciseTableManager(delegate: self)
    
    //get the user
    RealmDataMangers.retrieveUser()
    workouts = UserRealm.curUser.workoutArray.map{$0}
    
    //set the delegate for exercises table
    exerciseTableView.delegate = exerciseTableManager
    exerciseTableView.dataSource = exerciseTableManager
    
    //set the delegate for the workout table
    workoutTableView.delegate = workoutTableManager
    workoutTableView.dataSource = workoutTableManager
 
  }
  
  
  
  
}
