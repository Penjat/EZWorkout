

import UIKit

class CenterViewController: UIViewController {
  @IBOutlet weak var exerciseTableView: UITableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    exerciseTableView.dataSource = self
    exerciseTableView.delegate = self
    
  }
  
}

extension CenterViewController : UITableViewDelegate, UITableViewDataSource{
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 5
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "exerciseCell") as! ExerciseCell
    //TODO set up cell
    return cell
  }
  
  
}
