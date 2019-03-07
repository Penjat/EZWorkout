

import UIKit


class ExerciseTableManager : NSObject , UITableViewDelegate , UITableViewDataSource{
  
  var delegate: ExerciseTableManagerDelegate?
  
  init(delegate:ExerciseTableManagerDelegate){
    self.delegate = delegate
    
  }
  func numberOfSections(in tableView: UITableView) -> Int {
    if let delegate = delegate{
      return delegate.getExercisesByType().count
    }
    return 0
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    if let delegate = delegate{
      return delegate.getExercisesByType()[section].count
    }
    return 0
    
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "setCell") as! ExerciseSetCell
    let exercise = delegate?.getExercise(indexPath: indexPath)
    //TODO Excercise Realm doesn't have a weight property
    cell.setUp(intValue: -1, numReps: exercise!.reps)
    return cell
  }
  
  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    let headerView = ExerciseTypeView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 60))
    let exerciseType = delegate?.getExercisesByType()[section]
    //TODO check for plural/singular
    headerView.setUp(name: exerciseType![0].name!, numSets: "\(exerciseType!.count) sets")
    
    return headerView
  }
  
  
  
  
}

protocol ExerciseTableManagerDelegate {
  func getExercisesByType() -> [[ExcerciseRealm]]
  func getExercise(indexPath:IndexPath)->ExcerciseRealm
}
