

import UIKit

class CenterViewController: UIViewController {
  
  @IBOutlet weak var recView: UIView!
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


