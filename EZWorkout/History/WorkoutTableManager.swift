

import UIKit

class WorkoutTableManager : NSObject , UITableViewDelegate , UITableViewDataSource{
  
  var delegate : WorkoutTableManagerDelegate
  let formatter = DateFormatter()
  
  init(delegate:WorkoutTableManagerDelegate){
    self.delegate = delegate
    
    
    
    formatter.dateFormat = "dd"
    
    

  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return delegate.getWorkouts().count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "workoutCell") as! WorkoutCell
    
    if let workout = delegate.getWorkout(indexPath: indexPath){
      let dateString = formatter.string(from: workout.startTime!)
      cell.setUp(dateString: dateString)
    }else{
      cell.setUp(dateString:"")
    }
    
    
    return cell
  }
}

protocol WorkoutTableManagerDelegate{
  func getWorkouts() -> [WorkoutRealm]
  func getWorkout(indexPath:IndexPath)-> WorkoutRealm?
}
