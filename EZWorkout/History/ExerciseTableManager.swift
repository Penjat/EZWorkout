

import UIKit


class ExerciseTableManager : NSObject , UITableViewDelegate , UITableViewDataSource{
  
  var delegate: ExerciseTableManagerDelegate?
  
  init(delegate:ExerciseTableManagerDelegate){
    self.delegate = delegate
    
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    if let delegate = delegate{
      return delegate.getExercises().count
    }
    return 0
    
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "setCell") as! ExerciseSetCell
    //TODO set up with exercises
    return cell
  }
  
  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 18))
    let label = UILabel(frame: CGRect(x: 20, y: 20, width: 50, height: 50))
    label.text = "TEST TEXT"
    label.textColor = UIColor.blue
    
    //view.addSubview(headerView)
    
    return headerView
  }
  
  
  
}

protocol ExerciseTableManagerDelegate {
  func getExercises() -> [ExcerciseRealm]
}
