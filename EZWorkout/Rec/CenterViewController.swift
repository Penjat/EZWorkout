

import UIKit

class CenterViewController: UIViewController , CALayerDelegate ,UIScrollViewDelegate {
  

  
  @IBOutlet weak var recView: UIView!
  @IBOutlet weak var exerciseTableView: UITableView!
  @IBOutlet weak var helpView: HelpView!
  var gradient: CAGradientLayer!
  var gradient2: CAGradientLayer!
  
  @IBOutlet weak var helpScrollView: UIScrollView!
  
  
  var delegate: CenterViewProtocol?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    exerciseTableView.dataSource = self
    exerciseTableView.delegate = self
    
    helpScrollView.delegate = self
    
  }
  override func viewDidAppear(_ animated: Bool) {
    gradient = CAGradientLayer()
    gradient.delegate = self
    gradient.frame = helpScrollView.bounds
    gradient.colors = [UIColor.clear.cgColor, UIColor.black.cgColor, UIColor.black.cgColor, UIColor.clear.cgColor]
    gradient.locations = [0, 0.1, 0.9, 1]
    helpScrollView.layer.mask = gradient
    
    
    gradient2 = CAGradientLayer()
    gradient2.delegate = self
    gradient2.frame = helpScrollView.bounds
    gradient2.colors = [UIColor.clear.cgColor, UIColor.black.cgColor, UIColor.black.cgColor, UIColor.clear.cgColor]
    gradient2.locations = [0, 0.1, 0.9, 1]
    exerciseTableView.layer.mask = gradient2
    
  }
  
  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    
    updateGradientFrame()
    gradient2.frame = CGRect(
      x: 0,
      y: exerciseTableView.contentOffset.y,
      width: exerciseTableView.bounds.width,
      height: exerciseTableView.bounds.height
    )
  }
  // MARK: - CALayerDelegate
  func action(for layer: CALayer, forKey event: String) -> CAAction? {
    return NSNull()
  }
  
  func reloadTable(){
    exerciseTableView.reloadData()
  }
  
  func updateGradientFrame() {
    gradient.frame = CGRect(
      x: 0,
      y: helpScrollView.contentOffset.y,
      width: helpScrollView.bounds.width,
      height: helpScrollView.bounds.height
    )
  }
  
  func startRec(){
    //TODO animate properly
//
//    UIView.animate(withDuration: 0.5, animations: {
//      self.recView.backgroundColor = UIColor.white
//    })
  }
  func stopRec(){
    //TODO animate properly

//    UIView.animate(withDuration: 0.5, animations: {
//      //TODO get correct color of blue
//      self.recView.backgroundColor = UIColor(red:0.23, green:0.49, blue:0.93, alpha:1.0)
//    })
  }
  @IBAction func recordPressed(_ sender: Any) {
    if let delgate = delegate{
      delgate.recPressed()
    }
  }
  @IBAction func recReleased(_ sender: Any) {
    if let delgate = delegate{
      delgate.recReleased()
    }
  }
}


