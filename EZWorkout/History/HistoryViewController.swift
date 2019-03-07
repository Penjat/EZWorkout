

import UIKit

class HistoryViewController: UIViewController {
  
  @IBOutlet weak var exerciseTableView: UITableView!
  @IBOutlet weak var workoutTableView: UITableView!
  
  var workouts : [WorkoutRealm]?
  
  let exerciseTableManager = ExerciseTableManager()
  var workoutTableManager: WorkoutTableManager!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    workoutTableManager = WorkoutTableManager(delegate: self)
    
    RealmDataMangers.retrieveUser()
    workouts = UserRealm.curUser.workoutArray.map{$0}
    
    exerciseTableView.delegate = exerciseTableManager
    exerciseTableView.dataSource = exerciseTableManager
    
    workoutTableView.delegate = workoutTableManager
    workoutTableView.dataSource = workoutTableManager
    
    
  }
  
  
  
  
}
