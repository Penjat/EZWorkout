

import UIKit
import Charts

class StatsCenterVC: UIViewController {
  @IBOutlet weak var chart1: BarChartView!
  @IBOutlet weak var chart2: BarChartView!
  @IBOutlet weak var TypePieChartView: PieChartView!
    
    override func viewDidLoad() {
    super.viewDidLoad()
    
    print(UserRealm.curUser.name)
    let exerciseDict = StaticDataManager.getRealmData(type: .numberOfTimes)
    print("this  is a dictionary of  \(exerciseDict.count) ")
    let topSevenDict = StaticDataManager.sortRealmDict(Dict: exerciseDict)
    print("this is top 7 sport \(topSevenDict)")
    setUpTestData(chart: chart1 , chartLabels: topSevenDict.map{$0.0} , chartValues: topSevenDict.map{$0.1})
    let typeDitc = StaticDataManager.getRealmData(type: .type)
    let topTypeDict = StaticDataManager.sortRealmDict(Dict: typeDitc)
    setUpTestData(chart: chart2 , chartLabels: topTypeDict.map{$0.0} , chartValues: topTypeDict.map{$0.1})
        updateChartData(theChart: TypePieChartView, chartLabel: topTypeDict.map{$0.0},data: topTypeDict.map{ (key, value) in
            let k = PieChartDataEntry(value: Double(value))
            k.label = key
        return k
        
    })
   
   
    
  }
    
    func updateChartData(theChart: PieChartView, chartLabel:[String] ,data: [PieChartDataEntry]) {
        
        let dataInfo = PieChartDataSet(values: data, label: nil)
        let chartData = PieChartData(dataSet: dataInfo)
        let colors = [UIColor(named: "iosColor"), UIColor(named: "macColor"),UIColor.darkGray]
        dataInfo.colors = colors as![NSUIColor]
        theChart.data = chartData
        theChart.chartDescription?.text = ""
    }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    
    
    chart1.animate(xAxisDuration: 2.0, yAxisDuration: 2.0)
//    chart2.animate(xAxisDuration: 2.0, yAxisDuration: 2.0)
    
  }
  func navTo(page:Int){

  }
  
  func setUpTestData(chart: BarChartView , chartLabels:[String] , chartValues:[Int]){
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
   
  
  
  
}


