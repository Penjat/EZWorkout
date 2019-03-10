

import UIKit

extension NewHistoryViewController : UITableViewDataSource , UITableViewDelegate{
  
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return exercises.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "exerciseCell") as! ExerciseCell
    //TODO set up for multiple workouts in one day
    let exercise =  exercises[indexPath.row]
    cell.setUp(exerciseRealm:exercise)
    
    
    
    cell.backgroundColor = #colorLiteral(red: 0.4500938654, green: 0.9813225865, blue: 0.4743030667, alpha: 0)
    
    
    
    return cell
    
  }
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 96
  }
  
  
  
  
}
