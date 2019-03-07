

import UIKit


class ExerciseTableManager : NSObject , UITableViewDelegate , UITableViewDataSource{
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 0
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "setCell") as! ExerciseSetCell
    
    return cell
  }
  
  
}
