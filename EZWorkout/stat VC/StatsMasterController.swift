

import UIKit

class StatsMasterController: UIViewController {
  
  var centerController: StatsCenterVC!
  var topBarController: StatsTopBarVC!
  
 var curPage = 0
    @IBOutlet weak var StatsIcon: UITabBarItem!
    
  @IBOutlet weak var topBarScrollView: UIScrollView!
  @IBOutlet weak var centerScrollView: UIScrollView!
  
  
  
    override func viewDidLoad() {
        super.viewDidLoad()
       

      
    }
  override func viewDidAppear(_ animated: Bool) {
    
    super.viewDidAppear(animated)
    centerScrollView.delegate = self
    topBarController.delegate = self
    
    setStatBarPos(pageNum: curPage)
  }
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
    //get the container viewControllers
    if segue.identifier == "loadCenter"{
      //get the scroll view controller
      centerController = segue.destination as! StatsCenterVC
      
    }else if segue.identifier == "loadTopBar"{
      //get the top tab bar view controller
      topBarController = segue.destination as! StatsTopBarVC
      
    }
  }
  func setStatBarPos(pageNum:Int){
    
    //get the button for the current page and make sure it is at the center of the screen
    let offest = -view.frame.width/2  + topBarController.getButtonXPos(atIndex: pageNum)
    
    topBarScrollView.setContentOffset(CGPoint(x: offest, y: 0), animated: true)
  }
  
  func setCenterPos(pageNum:Int){
    
    let offset = view.frame.width * CGFloat(pageNum)
    centerScrollView.setContentOffset(CGPoint(x: offset, y: 0), animated: true)
  }
  
  
  
  
  

}
