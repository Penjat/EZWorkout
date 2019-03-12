

import UIKit

class StatsMasterController: UIViewController {
  @IBOutlet weak var sectionTitle: UILabel!
  
  var centerController: StatsCenterVC!
  var topBarController: StatsTopBarVC!
  
  var curPage = 0
  @IBOutlet weak var StatsIcon: UITabBarItem!
  
  @IBOutlet weak var topBarScrollView: UIScrollView!
  @IBOutlet weak var centerScrollView: UIScrollView!
  
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    topBarController.animateTopBars(page: curPage)
    let idleColor1 = #colorLiteral(red: 0.8964110017, green: 0.6467557549, blue: 0.6463074088, alpha: 1)
    let idleColor2 = #colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1)
    //TODO put in animation extention
    let gradient = CAGradientLayer()
    //startGradient()
    
    gradient.colors = [idleColor1.cgColor, idleColor2.cgColor]
    gradient.locations = [0.0 , 1.0]
    gradient.startPoint = CGPoint(x: 0.0, y: 1.0)
    gradient.endPoint = CGPoint(x: 1.0, y: 0.0)
    
    gradient.frame = CGRect(x: 0.0, y: 0.0, width: self.view.frame.size.width, height: self.view.frame.size.height)
    self.view.layer.insertSublayer(gradient, at: 0)
    
  }
  override func viewDidAppear(_ animated: Bool) {
    
    super.viewDidAppear(animated)
    sectionTitle.alpha = 0.3
    sectionTitle.transform = CGAffineTransform(scaleX: 1.4, y: 1.4)
    UIView.animate(withDuration: 1.0, animations: {
      self.sectionTitle.alpha = 1.0
      self.sectionTitle.transform = CGAffineTransform(scaleX: 1, y: 1)
    })
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
    
    topBarController.animateTopBars(page: pageNum)
    topBarScrollView.setContentOffset(CGPoint(x: offest, y: 0), animated: true)
  }
  
  func setCenterPos(pageNum:Int){
    
    let offset = view.frame.width * CGFloat(pageNum)
    centerScrollView.setContentOffset(CGPoint(x: offset, y: 0), animated: true)
  }
  
  
  
  
  
  
}
