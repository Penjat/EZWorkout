

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
      setupChart1()
      setupChart2()
      setupChart3()
    }
  
  func setupChart1(){
    //calculate calory percent
    //if daily
    
    let calendar = Calendar.current
    
    let year = calendar.component(.year, from: Date())
    let month = calendar.component(.month, from: Date())
    let day = 0
    let components = DateComponents(year: year, month: month, day: day, hour: 0, minute: 0, second: 0)
    
    //add one of time interval to date
    let startDate = calendar.date(from: components)!
    let endDate = startDate.adding(timeInterval: .day, amt: 1)
    let calsBurned = StaticDataManager.getCalForRange(startDate: startDate, endDate: endDate)
    
    //assume daily calorie goal of 300
    
    let goalPercent = CGFloat(calsBurned/300)
      
    chartCaloryGoal.startProgress(to: goalPercent, duration: 6) {
//      DispatchQueue.main.async {
//        // We can animate the ring back to another value here, and it does so fluidly
//        self.chartCaloryGoal.startProgress(to: 80, duration: 2)
//        //self.circuler.showsValueKnob = true
//      }
    }
    
  }
  
  func setupChart2(){
    //change for between date
    let stringTimeArray = StatHelper.getLastDates(num: 7, timeInterval: .day)
    let monthArray = stringTimeArray.map{$0.1}
    let calsBurned = StatHelper.createTotalforRange(timeArray: monthArray, timeInterval: .day, closure: StaticDataManager.getCalForRange(startDate:endDate:))
    
    
    
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
    
    let stringMonths = StatHelper.getLastDates(num: 7, timeInterval: .day)
    let weightFormonths = StatHelper.createTotalforRange(timeArray: stringMonths.map{$0.1}, timeInterval: .day, closure: StaticDataManager.getWeightForRange(startDate:endDate:))
    
    
    let barColor = #colorLiteral(red: 0.9428298473, green: 0.9622165561, blue: 0, alpha: 1)
    
    StaticDataManager.setUpChart(chart: chartTimeSpent , chartLabels: stringMonths.map{$0.0} , chartValues: weightFormonths , colors: [barColor],bottomLabelText: "Weigth Lifted")
    
    //      chart1.leftAxis.labelFont = UIFont(name: "Simply Rounded", size: 20.0)!
    chartTimeSpent.xAxis.labelFont  = UIFont(name: "Simply Rounded", size: 20.0)!
    
    chartTimeSpent.legend.font = UIFont(name: "Simply Rounded", size: 20.0)!
    
    
    //      chart1.legend.formSize = 20.0
    //      chart1.legend.yOffset = 20.0
    //      chart1.legend.neededHeight = 50
    //chart1.legend.enabled = false
    
    
    
    
  }

  

}
