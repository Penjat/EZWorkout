

import UIKit
import Charts

class StatsCenterVC: UIViewController {

  @IBOutlet weak var scrollView1: UIScrollView!
  
    var stat3 = StatPage3Controller()
    var stat4 = StatPage4Controller()
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
        switch page {
        case 0: return
            
        case 1:
            totalVC.animateGraph()
       // case 2:
           // TypePieChartView.animate(yAxisDuration: 1)
       case 2:
            stat3.animateGraph()
        default:
            stat4.animateGraph()
        }
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      if (segue.identifier == "embedStatPage1"){
        let statPage1 = segue.destination as! StatsPage1Controller
        statPage1.view.translatesAutoresizingMaskIntoConstraints = false
        //totalVC = segue.destination
        
        
      }else if segue.identifier == "goTotal"{
        totalVC = segue.destination as! StatTotalVC
        totalVC.view.translatesAutoresizingMaskIntoConstraints = false
       
        }else if segue.identifier == "page3"{
        stat3 = segue.destination as! StatPage3Controller
        stat3.view.translatesAutoresizingMaskIntoConstraints = false
        
      }else if segue.identifier == "page4"{
        stat4 = segue.destination as! StatPage4Controller
        stat4.view.translatesAutoresizingMaskIntoConstraints = false
       
    }
  
 
    
    
   
  
  
  
  }


}

