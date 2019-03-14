

import UIKit
import RAMAnimatedTabBarController

class MasterTabBarController: UITabBarController {
  
  @IBOutlet weak var mainTabBar: UITabBar!
  override func viewDidLoad() {
    super.viewDidLoad()
    delegate = self
    tabBar.backgroundImage = UIColor.clear.image()
  }
  
  
  
  
}
extension MasterTabBarController: UITabBarControllerDelegate  {
  func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
    
    guard let fromView = selectedViewController?.view, let toView = viewController.view else {
      return false // Make sure you want this as false
    }
    
    if fromView != toView {
      UIView.transition(from: fromView, to: toView, duration: 0.3, options: [.transitionCrossDissolve], completion: nil)
    }
    
    return true
  }
}
