

import UIKit
import Charts

class StatsCenterVC: UIViewController {
  @IBOutlet weak var chart1: BarChartView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    setUpTestData(chart: chart1)
    chart1.animate(xAxisDuration: 2.0, yAxisDuration: 2.0)
  }
  
  func setUpTestData(chart: BarChartView){
    //chart.delegate = self
    chart.noDataText = "You need to provide data for the chart."
    let unitsSold = [20.0, 4.0, 6.0, 3.0, 12.0, 16.0, 4.0, 18.0, 2.0, 4.0, 5.0, 4.0]
    let months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
    var dataEntries: [BarChartDataEntry] = []
    
    for i in 0 ..< months.count{
      //            Double(test[i])
      
      let dataEntry = BarChartDataEntry(x: Double(i), y: Double(unitsSold[i]))
      dataEntries.append(dataEntry)
    }
    
    let chartDataSet = BarChartDataSet(values: dataEntries, label: "Visitor count")
    let chartData = BarChartData(dataSet: chartDataSet)
    //chartDataSet.colors = ChartColorTemplates.joyful()
    chart.data = chartData
    
    chart.xAxis.valueFormatter = IndexAxisValueFormatter(values: months)
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
    //let test = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]
    
    
  }
  
  
  
}
