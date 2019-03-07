

import UIKit

class WorkoutTableManager : NSObject , UITableViewDelegate , UITableViewDataSource{
  
  var delegate : WorkoutTableManagerDelegate
  let dateFormater = DateFormatter()
  let timeFormater = DateFormatter()
  
  init(delegate:WorkoutTableManagerDelegate){
    self.delegate = delegate
    
    
    
    dateFormater.dateFormat = "d"
    //dateFormater.dateStyle = .short
    timeFormater.dateFormat = "h:mm"
    //timeFormater.timeStyle = .short
    

  }
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 80
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return delegate.getWorkouts().count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "workoutCell") as! WorkoutCell
    
    if let workout = delegate.getWorkout(indexPath: indexPath){
      let dateString = dateFormater.string(from: workout.startTime!)
      let timeString = timeFormater.string(from: workout.startTime!)
      cell.setUp(dateString: dateString , timeString: timeString)
    }else{
      cell.setUp(dateString:"" , timeString: "")
    }
    
    
    return cell
  }
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    print("seleceted workout \(indexPath.row)")
    
    delegate.workoutPressed(atIndex:indexPath)
    
  }
}

protocol WorkoutTableManagerDelegate{
  func getWorkouts() -> [WorkoutRealm]
  func getWorkout(indexPath:IndexPath)-> WorkoutRealm?
  func workoutPressed(atIndex index:IndexPath)
}
