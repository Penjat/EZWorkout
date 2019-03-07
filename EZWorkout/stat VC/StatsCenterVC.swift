

import UIKit
import Charts

class StatsCenterVC: UIViewController {
  @IBOutlet weak var chart1: BarChartView!
  @IBOutlet weak var chart2: BarChartView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    print(UserRealm.curUser.name)
    let exerciseDict = self.getRealmData()
    print("this  is a dictionary of  \(exerciseDict.count) ")
    let topSevenDict = self.sortRealmDict(Dict: exerciseDict)
    print("this is top 7 sport \(topSevenDict)")
    setUpTestData(chart: chart1 , chartLabels: topSevenDict.map{$0.0} , chartValues: topSevenDict.map{$0.1})
//    setUpTestData(chart: chart1 , chartLabels: chartLabels , chartValues: chartValues)
   
    
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    
    
    chart1.animate(xAxisDuration: 2.0, yAxisDuration: 2.0)
//    chart2.animate(xAxisDuration: 2.0, yAxisDuration: 2.0)
    
  }
  func navTo(page:Int){
    //TODO call animate on the correct page
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
    func getRealmData()->[String:Int]{
        let results = UserRealm.curUser.getAllExercises()
        var emptyDict = [String:Int]()
        for item in results{
            
            if emptyDict.index(forKey: item.name!) == nil {
                emptyDict[item.name!] = 1
            } else{
                let num = emptyDict[item.name!]
                emptyDict.updateValue(num!+1, forKey: item.name!)
            }
        }
        return emptyDict
        
    }

    
    func sortRealmDict(Dict:[String:Int])->[(String,Int)]{
        
        var emptyDict = [String:Int]()
        for newItem in Dict{
            if emptyDict.count < 7 {
                print("the count is \(emptyDict.count) adding \(newItem.key)")
                emptyDict[newItem.key] = newItem.value
            }else{
                for oldItem in emptyDict{
                    if(newItem.value > oldItem.value){
                      emptyDict.removeValue(forKey: oldItem.key)
                      emptyDict[newItem.key] = newItem.value
                        break
                    }
                }
            }
        }

        
        return emptyDict.sorted(by: {$0.value > $1.value})
    }
  
  
  
}


