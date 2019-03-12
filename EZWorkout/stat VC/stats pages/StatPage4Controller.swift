

import UIKit
import Charts
import UICircularProgressRing

class StatPage4Controller: UIViewController {
  
  @IBOutlet weak var chartCaloryGoal: UICircularProgressRing!

  @IBOutlet weak var chartTimeSpent: BarChartView!
  
  @IBOutlet weak var chartCaloriesBurned: BarChartView!
  
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
      setupChart2()
      setupChart3()
    }
  
  
  func setupChart2(){
    //change for between date
    let stringTimeArray = StatHelper.getLastDates(num: 7, timeInterval: .month)
    let monthArray = stringTimeArray.map{$0.1}
    let calsBurned = StatHelper.createTotal(timeArray: monthArray , closure: StaticDataManager.getCal(date:))
    
    
    
    //chartTotalReps.xAxis.labelFont  = UIFont(name: "Simply Rounded", size: 20.0)!
    
    chartCaloriesBurned.legend.font = UIFont(name: "Simply Rounded", size: 20.0)!
   
    
    
    let barColor = #colorLiteral(red: 0.9428298473, green: 0.9622165561, blue: 0, alpha: 1)
    
    StaticDataManager.setUpChart(chart: chartCaloriesBurned, chartLabels: stringTimeArray.map{$0.0}, chartValues: calsBurned,colors: [barColor],bottomLabelText: "Calories Burned")
    
    //      chart1.leftAxis.labelFont = UIFont(name: "Simply Rounded", size: 20.0)!
    chartCaloriesBurned.xAxis.labelFont  = UIFont(name: "Simply Rounded", size: 20.0)!
    
    //chartCaloriesBurned.legend.font = UIFont(name: "Simply Rounded", size: .0)!
    
    
    //      chart1.legend.formSize = 20.0
    //      chart1.legend.yOffset = 20.0
    //      chart1.legend.neededHeight = 50
    //chart1.legend.enabled = false
    
    
    
    
  }
  
  func setupChart3(){
    
    print(UserRealm.curUser.name)
    let exerciseDict = StaticDataManager.getRealmData(type: .numberOfTimes)
    print("this  is a dictionary of  \(exerciseDict.count) ")
    let topSevenDict = StaticDataManager.sortRealmDict(dict: exerciseDict)
    print("this is top 7 sport \(topSevenDict)")
    
    
    let barColor = #colorLiteral(red: 0.9428298473, green: 0.9622165561, blue: 0, alpha: 1)
    
    StaticDataManager.setUpChart(chart: chartTimeSpent , chartLabels: topSevenDict.map{$0.0} , chartValues: topSevenDict.map{$0.1} , colors: [barColor],bottomLabelText: "Weigth")
    
    //      chart1.leftAxis.labelFont = UIFont(name: "Simply Rounded", size: 20.0)!
    chartTimeSpent.xAxis.labelFont  = UIFont(name: "Simply Rounded", size: 20.0)!
    
    chartTimeSpent.legend.font = UIFont(name: "Simply Rounded", size: 20.0)!
    
    
    //      chart1.legend.formSize = 20.0
    //      chart1.legend.yOffset = 20.0
    //      chart1.legend.neededHeight = 50
    //chart1.legend.enabled = false
    
    
    
    
  }

  

}
