

import UIKit
import Charts

class StatsCenterVC: UIViewController {
  @IBOutlet weak var chart1: BarChartView!
    
    
    var userVC = StatUserVC()
    var totalVC = StatTotalVC()
    
    override func viewDidLoad() {
    super.viewDidLoad()
    
    print(UserRealm.curUser.name)
    let exerciseDict = StaticDataManager.getRealmData(type: .numberOfTimes)
    print("this  is a dictionary of  \(exerciseDict.count) ")
    let topSevenDict = StaticDataManager.sortRealmDict(Dict: exerciseDict)
    print("this is top 7 sport \(topSevenDict)")
      
      let barColor = #colorLiteral(red: 0.9428298473, green: 0.9622165561, blue: 0, alpha: 1)
      
    StaticDataManager.setUpChart(chart: chart1 , chartLabels: topSevenDict.map{$0.0} , chartValues: topSevenDict.map{$0.1} , colors: [barColor],bottomLabelText: "Reps")

//      chart1.leftAxis.labelFont = UIFont(name: "Simply Rounded", size: 20.0)!
      chart1.xAxis.labelFont  = UIFont(name: "Simply Rounded", size: 20.0)!
      
      chart1.legend.font = UIFont(name: "Simply Rounded", size: 20.0)!
//      chart1.legend.formSize = 20.0
//      chart1.legend.yOffset = 20.0
//      chart1.legend.neededHeight = 50
      chart1.legend.enabled = false
      
  }

  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    pageAnimation(page: 0)
   
    
  }
    func pageAnimation(page:Int){
        switch page {
        case 0:
            chart1.animate(xAxisDuration: 2.0, yAxisDuration: 2.0)
        case 1:
            totalVC.animateGraph()
       // case 2:
           // TypePieChartView.animate(yAxisDuration: 1)
       case 3:
            userVC.animateCircular()
        default:
            return
        }
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




