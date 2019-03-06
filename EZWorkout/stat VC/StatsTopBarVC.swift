

import UIKit

class StatsTopBarVC: UIViewController {
  
  @IBOutlet weak var chartButton1: UIButton!
  @IBOutlet weak var chartButton2: UIButton!
  @IBOutlet weak var chartButton3: UIButton!
  @IBOutlet weak var chartButton4: UIButton!
  @IBOutlet weak var chartButton5: UIButton!
  
  var buttonArray: [UIButton]?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    buttonArray = [chartButton1,chartButton2,chartButton3,chartButton4,chartButton5]
    
  }
  func getButtonXPos(atIndex:Int) -> CGFloat{
    
    if let buttonArray = buttonArray , atIndex < buttonArray.count{
      return buttonArray[atIndex].center.x
    }
    return 0
  }
  
  
  @IBAction func navButtonPressed(_ sender: UIButton) {
    
    print("the buttons position is \(sender.tag)")
  }
  
  
  
}
