

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
  
  func startRec(){
    //TODO animate properly
    return
    UIView.animate(withDuration: 0.5, animations: {
      self.recView.backgroundColor = UIColor.white
    })
  }
  func stopRec(){
    //TODO animate properly
    return
    UIView.animate(withDuration: 0.5, animations: {
      //TODO get correct color of blue
      self.recView.backgroundColor = UIColor(red:0.23, green:0.49, blue:0.93, alpha:1.0)
    })
  }
  
}


