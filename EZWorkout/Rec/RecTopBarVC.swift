
import UIKit

class RecTopBarVC: UIViewController {
  
  @IBOutlet weak var barButton1: UIButton!
  @IBOutlet weak var barButton2: UIButton!
  @IBOutlet weak var barButton3: UIButton!
  
  var buttonArray : [UIButton]?
  var delegate : TopBarDelegate?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    buttonArray = [barButton1,barButton2,barButton3]
    
  }
  @IBAction func barButtonPressed(_ sender: UIButton) {
    print("the buttons position is \(sender.tag)")
    if let delegate = delegate {
      delegate.scrollTo(pageNum: sender.tag)
    }else{
      print("error: delegate not set")
    }
  }
  
  func getButtonXPos(atIndex:Int) -> CGFloat{
    
    if let buttonArray = buttonArray , atIndex < buttonArray.count{
      return buttonArray[atIndex].center.x
    }
    return 0
  }
  
  
  
  
}
