

import UIKit
import Charts

class StatsCenterVC: UIViewController {

    
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
        if (segue.identifier == "goUser"){
            userVC = segue.destination as! StatUserVC
           // viewController.animateCircular()
            
        }else if (segue.identifier == "goTotal"){
            totalVC = segue.destination as! StatTotalVC
        }
    }
  
 
    
    
   
  
  
  
}




