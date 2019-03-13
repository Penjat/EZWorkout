

import UIKit
import Charts


class StatsPage1Controller: UIViewController {
  @IBOutlet weak var chart1: HorizontalBarChartView!
  @IBOutlet weak var chart2: HorizontalBarChartView!
  @IBOutlet weak var chart3: HorizontalBarChartView!
  
  
  
  @IBOutlet weak var chart1Text: UILabel!
  @IBOutlet weak var chart2Text: UILabel!
  @IBOutlet weak var chart3Text: UILabel!
  
  
  var chartArray : [BarChartView]!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupChart1()
    setupChart2()
    setupChart3()
    
    
    
  }
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    chartArray = [chart1,chart2,chart3]
    checkShouldAnimate()
  }
  
  func checkShouldAnimate(scrollPos:CGFloat = 0){
    let screenSize = UIScreen.main.bounds
    let screenHeight = screenSize.height
    
    var i = 0
    for chart in chartArray{
      
      if chart.frame.maxY < scrollPos + screenHeight{
        
        chart.animate(xAxisDuration: 0.0, yAxisDuration: 2.0)
        chartArray.remove(at: i)
        
        
        //leftAxis.labelFont = .systemFont(ofSize: 10, weight: .light)
        
        
        i += 1
      }else{
        
      }
    }
  }
  
  func setupChart1(){
    //top exercises by set
    
    
    let exerciseDict = StaticDataManager.getRealmDataGroupedbyWeight(startDate: nil, endDate: nil)
    
    let topSevenDict = StaticDataManager.sortRealmDict(dict: exerciseDict)
    
    
    print("this is top 7 sport \(topSevenDict)")
    
    let barColor = #colorLiteral(red: 0.9428298473, green: 0.9622165561, blue: 0, alpha: 1)
    
    StaticDataManager.setUpChart(chart: chart1 , chartLabels: topSevenDict.map{$0.0} , chartValues: topSevenDict.map{$0.1} , colors: [barColor],bottomLabelText: "Total Weigth Moved")
    
    //      chart1.leftAxis.labelFont = UIFont(name: "Simply Rounded", size: 20.0)!
    chart1.xAxis.labelFont  = UIFont(name: "Simply Rounded", size: 20.0)!
    
    chart1.legend.font = UIFont(name: "Simply Rounded", size: 20.0)!
    
    
    
    
    //      chart1.legend.formSize = 20.0
    //      chart1.legend.yOffset = 20.0
    //      chart1.legend.neededHeight = 50
    //chart1.legend.enabled = false
    
    
    
    
  }
  func setupChart2(){
    let exerciseDict = StaticDataManager.getRealmDataGroupedbySets(startDate: nil, endDate: nil)
    
    let topSevenDict = StaticDataManager.sortRealmDict(dict: exerciseDict)
    
    
    print("this is top 7 sport \(topSevenDict)")
    
    let barColor = #colorLiteral(red: 0.9428298473, green: 0.9622165561, blue: 0, alpha: 1)
    
    
    
    
    StaticDataManager.setUpChart(chart: chart2 , chartLabels: topSevenDict.map{$0.0} , chartValues: topSevenDict.map{$0.1} , colors: [barColor],bottomLabelText: "Total Sets")
    
    chart2.xAxis.labelFont  = UIFont(name: "Simply Rounded", size: 20.0)!
    
    chart2.legend.font = UIFont(name: "Simply Rounded", size: 20.0)!
    
  }
  
  func setupChart3(){
    let exerciseDict = StaticDataManager.getRealmDataGroupedbyReps(startDate: nil, endDate: nil)
    
    let topSevenDict = StaticDataManager.sortRealmDict(dict: exerciseDict)
    
    
    print("this is top 7 sport \(topSevenDict)")
    
    let barColor = #colorLiteral(red: 0.9428298473, green: 0.9622165561, blue: 0, alpha: 1)
    
    
    
    StaticDataManager.setUpChart(chart: chart3 , chartLabels: topSevenDict.map{$0.0} , chartValues: topSevenDict.map{$0.1} , colors: [barColor],bottomLabelText: "Total Reps")
    
    chart3.xAxis.labelFont  = UIFont(name: "Simply Rounded", size: 20.0)!
    
    chart3.legend.font = UIFont(name: "Simply Rounded", size: 20.0)!
  }
  
  
  
  
}
