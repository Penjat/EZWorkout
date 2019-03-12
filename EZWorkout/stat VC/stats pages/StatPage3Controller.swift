

import UIKit
import Charts

class StatPage3Controller: UIViewController {
  
  @IBOutlet weak var chartRestingHeart: LineChartView!
  @IBOutlet weak var chartUserWeight: LineChartView!
  @IBOutlet weak var chartBMI: LineChartView!
  
    override func viewDidLoad() {
        super.viewDidLoad()
      setupChart1()
      setupChart2()
      setupChart3()
    }
  
  func setupChart1(){
    let numbers = [20.0,66.0,90.0,100.0]
    
    var values = [ChartDataEntry]()
    var i = 0.0
    for num in numbers{
      values.append(ChartDataEntry(x: i, y: num))
      i += 1.0
    }
    
    
    
    
    
    let set1 = LineChartDataSet(values: values, label: "resting Heart rate")
    set1.drawIconsEnabled = false
    
    set1.lineDashLengths = [5, 2.5]
    set1.highlightLineDashLengths = [5, 2.5]
    set1.setColor(.black)
    set1.setCircleColor(.black)
    set1.lineWidth = 1
    set1.circleRadius = 3
    set1.drawCircleHoleEnabled = false
    set1.valueFont = .systemFont(ofSize: 9)
    set1.formLineDashLengths = [5, 2.5]
    set1.formLineWidth = 1
    set1.formSize = 15
    
    let gradientColors = [ChartColorTemplates.colorFromString("#00ff0000").cgColor,
                          ChartColorTemplates.colorFromString("#ffff0000").cgColor]
    let gradient = CGGradient(colorsSpace: nil, colors: gradientColors as CFArray, locations: nil)!
    
    set1.fillAlpha = 1
    set1.fill = Fill(linearGradient: gradient, angle: 90) //.linearGradient(gradient, angle: 90)
    set1.drawFilledEnabled = true
    
    let data = LineChartData(dataSet: set1)
    
    chartRestingHeart.data = data
  }

  
  func setupChart2(){
    let numbers = [20.0,66.0,90.0,100.0]
    
    var values = [ChartDataEntry]()
    var i = 0.0
    for num in numbers{
      values.append(ChartDataEntry(x: i, y: num))
      i += 1.0
    }
    
    
    
    
    
    let set1 = LineChartDataSet(values: values, label: "resting Heart rate")
    set1.drawIconsEnabled = false
    
    set1.lineDashLengths = [5, 2.5]
    set1.highlightLineDashLengths = [5, 2.5]
    set1.setColor(.black)
    set1.setCircleColor(.black)
    set1.lineWidth = 1
    set1.circleRadius = 3
    set1.drawCircleHoleEnabled = false
    set1.valueFont = .systemFont(ofSize: 9)
    set1.formLineDashLengths = [5, 2.5]
    set1.formLineWidth = 1
    set1.formSize = 15
    
    let gradientColors = [ChartColorTemplates.colorFromString("#00ff0000").cgColor,
                          ChartColorTemplates.colorFromString("#ffff0000").cgColor]
    let gradient = CGGradient(colorsSpace: nil, colors: gradientColors as CFArray, locations: nil)!
    
    set1.fillAlpha = 1
    set1.fill = Fill(linearGradient: gradient, angle: 90) //.linearGradient(gradient, angle: 90)
    set1.drawFilledEnabled = true
    
    let data = LineChartData(dataSet: set1)
    
    chartUserWeight.data = data
  }
  func setupChart3(){
    let numbers = [20.0,66.0,90.0,100.0]
    
    var values = [ChartDataEntry]()
    var i = 0.0
    for num in numbers{
      values.append(ChartDataEntry(x: i, y: num))
      i += 1.0
    }
    
    
    
    
    
    let set1 = LineChartDataSet(values: values, label: "resting Heart rate")
    set1.drawIconsEnabled = false
    
    set1.lineDashLengths = [5, 2.5]
    set1.highlightLineDashLengths = [5, 2.5]
    set1.setColor(.black)
    set1.setCircleColor(.black)
    set1.lineWidth = 1
    set1.circleRadius = 3
    set1.drawCircleHoleEnabled = false
    set1.valueFont = .systemFont(ofSize: 9)
    set1.formLineDashLengths = [5, 2.5]
    set1.formLineWidth = 1
    set1.formSize = 15
    
    let gradientColors = [ChartColorTemplates.colorFromString("#00ff0000").cgColor,
                          ChartColorTemplates.colorFromString("#ffff0000").cgColor]
    let gradient = CGGradient(colorsSpace: nil, colors: gradientColors as CFArray, locations: nil)!
    
    set1.fillAlpha = 1
    set1.fill = Fill(linearGradient: gradient, angle: 90) //.linearGradient(gradient, angle: 90)
    set1.drawFilledEnabled = true
    
    let data = LineChartData(dataSet: set1)
    
    chartBMI.data = data
  }

}
