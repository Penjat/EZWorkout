

import UIKit

class CenterViewController: UIViewController {
  
  @IBOutlet weak var exerciseTableView: UITableView!
  
  var delegate: CenterViewProtocol?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    exerciseTableView.dataSource = self
    exerciseTableView.delegate = self
    
  }
  
  func reloadTable(){
    exerciseTableView.reloadData()
  }
  
}

extension CenterViewController : UITableViewDelegate, UITableViewDataSource{
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if let delegate = delegate {
      return delegate.getExerciseArray().count
    }
    
    return 0
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "exerciseCell") as! ExerciseCell
    //TODO set up cell
    return cell
  }
  
  
}
