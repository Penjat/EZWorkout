

import UIKit

extension CenterViewController : UITableViewDelegate, UITableViewDataSource{
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if let delegate = delegate {
      return delegate.getExerciseArray().count
    }
    
    return 0
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "exerciseCell") as! ExerciseCell
    
    if let delegate = delegate , let exercise =  delegate.getExercise(atIndex:indexPath.row){
      cell.setUp(exerciseModel:exercise)
    }
    
    
    cell.backgroundColor = #colorLiteral(red: 0.4500938654, green: 0.9813225865, blue: 0.4743030667, alpha: 0)
    
    
    
    return cell
  }
  
  func startRec(){
    UIView.animate(withDuration: 0.5, animations: {
      self.recView.backgroundColor = UIColor.white
    })
  }
  func stopRec(){
    UIView.animate(withDuration: 0.5, animations: {
      //TODO get correct color of blue
      self.recView.backgroundColor = UIColor(red:0.23, green:0.49, blue:0.93, alpha:1.0)
    })
  }
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 96
  }
  
  
}
