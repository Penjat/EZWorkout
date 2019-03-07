

import UIKit
import Charts

class StatsCenterVC: UIViewController {
  @IBOutlet weak var chart1: BarChartView!
  @IBOutlet weak var chart2: BarChartView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    RealmDataMangers.retrieveUser()
    print("the current user has \(UserRealm.curUser.workoutArray.count) workouts")
    
    print("the current user has done  \(UserRealm.curUser.getAllExercises().filter({$0.name == "pushup"}).count) bench presses")
    
    let chartValues = [20.0, 4.0, 6.0, 3.0, 12.0, 16.0, 4.0, 18.0, 2.0, 4.0, 5.0, 4.0]
    let chartLabels = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
    
    setUpTestData(chart: chart1 , chartLabels: chartLabels , chartValues: chartValues)
    let weight = [20.0, 4.0, 6.0, 3.0, 12.0, 16.0, 4.0]
    let days = ["mon", "tue", "wed", "thu", "fri","sat","sun"]
    setUpTestData(chart: chart2 , chartLabels: days , chartValues: weight)
    
    chart1.animate(xAxisDuration: 2.0, yAxisDuration: 2.0)
    
    
  }
  func navTo(page:Int){
    //TODO call animate on the correct page
  }
  
  func setUpTestData(chart: BarChartView , chartLabels:[String] , chartValues:[Double]){
    //chart.delegate = self
    chart.noDataText = "You need to provide data for the chart."
    
    var dataEntries: [BarChartDataEntry] = []
    
    for i in 0 ..< chartLabels.count{
      //            Double(test[i])
      
      let dataEntry = BarChartDataEntry(x: Double(i), y: Double(chartValues[i]))
      dataEntries.append(dataEntry)
    }
    
    let chartDataSet = BarChartDataSet(values: dataEntries, label: "Visitor count")
    let chartData = BarChartData(dataSet: chartDataSet)
    //chartDataSet.colors = ChartColorTemplates.joyful()
    chart.data = chartData
    
    chart.xAxis.valueFormatter = IndexAxisValueFormatter(values: chartLabels)
    chart.xAxis.granularity = 1
    chart.chartDescription?.text = ""
    chart.xAxis.labelPosition = .bottom
    
    //barChart.leftAxis.drawGridLinesEnabled = false
    chart.rightAxis.enabled = false
    //barChart.rightAxis.drawGridLinesEnabled = false
    
    chart.xAxis.drawGridLinesEnabled = false
    chart.backgroundColor = UIColor(red: 189/255, green: 195/255, blue: 199/255, alpha: 1)
    let ll = ChartLimitLine(limit: 9.0, label: "Average")
    chart.rightAxis.addLimitLine(ll)
  }
  
  func setChart(dataPoints: [String], values:[Double])
  {
    
    
    
  }
  
  
  
}
