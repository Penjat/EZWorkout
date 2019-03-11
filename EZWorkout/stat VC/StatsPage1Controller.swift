

import UIKit
import Charts

class StatsPage1Controller: UIViewController {
  @IBOutlet weak var chart1: HorizontalBarChartView!
  @IBOutlet weak var chart2: HorizontalBarChartView!
  @IBOutlet weak var chart3: HorizontalBarChartView!
  
  @IBOutlet weak var chart1Text: UILabel!
  @IBOutlet weak var chart2Text: UILabel!
  @IBOutlet weak var chart3Text: UILabel!
  
  
  override func viewDidLoad() {
        super.viewDidLoad()
    
    print(UserRealm.curUser.name)
    let exerciseDict = StaticDataManager.getRealmData(type: .numberOfTimes)
    print("this  is a dictionary of  \(exerciseDict.count) ")
    let topSevenDict = StaticDataManager.sortRealmDict(Dict: exerciseDict)
    print("this is top 7 sport \(topSevenDict)")
    
    let barColor = #colorLiteral(red: 0.9428298473, green: 0.9622165561, blue: 0, alpha: 1)
    
        StaticDataManager.setUpChart(chart: chart1 , chartLabels: topSevenDict.map{$0.0} , chartValues: topSevenDict.map{$0.1} , colors: [barColor],bottomLabelText: "Weigth")
    
    //      chart1.leftAxis.labelFont = UIFont(name: "Simply Rounded", size: 20.0)!
          chart1.xAxis.labelFont  = UIFont(name: "Simply Rounded", size: 20.0)!
    
          chart1.legend.font = UIFont(name: "Simply Rounded", size: 20.0)!
    
    
    //      chart1.legend.formSize = 20.0
    //      chart1.legend.yOffset = 20.0
    //      chart1.legend.neededHeight = 50
          //chart1.legend.enabled = false
    
    StaticDataManager.setUpChart(chart: chart2 , chartLabels: topSevenDict.map{$0.0} , chartValues: topSevenDict.map{$0.1} , colors: [barColor],bottomLabelText: "Sets")
    
    chart2.xAxis.labelFont  = UIFont(name: "Simply Rounded", size: 20.0)!
    
    chart2.legend.font = UIFont(name: "Simply Rounded", size: 20.0)!
    
    StaticDataManager.setUpChart(chart: chart3 , chartLabels: topSevenDict.map{$0.0} , chartValues: topSevenDict.map{$0.1} , colors: [barColor],bottomLabelText: "Reps")
    
    chart3.xAxis.labelFont  = UIFont(name: "Simply Rounded", size: 20.0)!
    
    chart3.legend.font = UIFont(name: "Simply Rounded", size: 20.0)!
    }
    

  

}
