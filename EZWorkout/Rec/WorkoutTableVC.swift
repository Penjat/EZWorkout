
import UIKit

class WorkoutTableVC: UIViewController, UITableViewDataSource , UITableViewDelegate{
 
  
  @IBOutlet weak var workoutTableView: UITableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    workoutTableView.dataSource = self
    workoutTableView.delegate = self
    
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 5
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "exerciseCell") as! ExerciseCell
    //TODO set up with exercise data
    return cell
  }
  
  
  
  
}
