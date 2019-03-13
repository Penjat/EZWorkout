

import UIKit
import Charts

class StatsCenterVC: UIViewController {

  @IBOutlet weak var scrollView1: UIScrollView!
  
    var userVC = StatUserVC()
    var totalVC = StatTotalVC()
    
    override func viewDidLoad() {
    super.viewDidLoad()
    
    
      
  }

  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    pageAnimation(page: 0)
   
    
  }
    func pageAnimation(page:Int){
      //TODO put this code back
//        switch page {
//        case 0:
//            chart1.animate(xAxisDuration: 2.0, yAxisDuration: 2.0)
//        case 1:
//            totalVC.animateGraph()
//       // case 2:
//           // TypePieChartView.animate(yAxisDuration: 1)
//       case 3:
//            userVC.animateCircular()
//        default:
//            return
//        }
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      if (segue.identifier == "goTotal"){
        let statPage1 = segue.destination as! StatsPage1Controller
        scrollView1.delegate = statPage1
        
        
      }
    }
  
 
    
    
   
  
  
  
}




