//
//  StatTotalVC.swift
//  EZWorkout
//
//  Created by Yilei Huang on 2019-03-10.
//  Copyright © 2019 Spencer Symington. All rights reserved.
//

import UIKit
import Charts

class StatTotalVC: UIViewController {
    

    @IBOutlet weak var pieChart: PieChartView!
    
    @IBOutlet weak var timeGraph: BarChartView!
    @IBOutlet weak var static1: BarChartView!
  @IBOutlet weak var chartTotalReps: BarChartView!
  
  var stringTimeArray = StatHelper.getLastDates(num: 7, timeInterval: .month)
  
  
  
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpChart1()
        setUpChart2()
        setUpChart3()
        let exerciseDict = StaticDataManager.getRealmData(type: .type)
        let topSevenDict = StaticDataManager.sortRealmDict(dict: exerciseDict)
        
        var total = 0
        for (_,i) in topSevenDict{
            total += i
        }
        updateChartData(theChart: pieChart, chartLabel: topSevenDict.map{$0.0}, data: topSevenDict.map{(arg) -> PieChartDataEntry in
            
            var (key, value) = arg
            value = (value*100/total)
            let k = PieChartDataEntry(value:Double(value))
            k.label = key
            return k
        })
      
       
    }
    func animateGraph(){
        pieChart.animate(yAxisDuration: 1.4, easing: EasingFunctions.EaseOutBack)
        timeGraph.animate(xAxisDuration: 2.0, yAxisDuration: 2.0)
        static1.animate(xAxisDuration: 2.0, yAxisDuration: 2.0)
        chartTotalReps.animate(xAxisDuration: 2.0, yAxisDuration: 2.0)
    }
    
    internal struct EasingFunctions
    {
    internal static let EaseOutBack = { (elapsed: TimeInterval, duration: TimeInterval) -> Double in
        let s: TimeInterval = 1.70158
        var position: TimeInterval = elapsed / duration
        position -= 1.0
        return Double( position * position * ((s + 1.0) * position + s) + 1.0 )
    }
    }
    func updateChartData(theChart: PieChartView, chartLabel:[String] ,data: [PieChartDataEntry]) {
        
        let dataInfo = PieChartDataSet(values: data, label: nil)
        let colors = [#colorLiteral(red: 0.4160000086, green: 0.6200000048, blue: 0.851000011, alpha: 1),#colorLiteral(red: 0.5427411795, green: 1, blue: 0.4465199709, alpha: 1),#colorLiteral(red: 1, green: 0.3947873712, blue: 0.8685549498, alpha: 1),#colorLiteral(red: 0.7254902124, green: 0.4784313738, blue: 0.09803921729, alpha: 1),#colorLiteral(red: 1, green: 0.3460842371, blue: 0.2327074111, alpha: 1)]
       
        dataInfo.colors = colors as![NSUIColor]
        dataInfo.entryLabelColor = .white
        dataInfo.valueLinePart1OffsetPercentage = 0.8
        dataInfo.valueLinePart1Length = 0.2
        dataInfo.valueLinePart2Length = 0.4
        //set.xValuePosition = .outsideSlice
        dataInfo.yValuePosition = .outsideSlice
        
        let chartData = PieChartData(dataSet: dataInfo)
        let pFormatter = NumberFormatter()
        pFormatter.numberStyle = .percent
        pFormatter.maximumFractionDigits = 1
        pFormatter.multiplier = 1
        pFormatter.percentSymbol = " %"
        chartData.setValueFormatter(DefaultValueFormatter(formatter: pFormatter))
        chartData.setValueFont(UIFont(name: "Simply Rounded", size: 14.0)!)
     
        chartData.setValueTextColor(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
        
        theChart.data = chartData
        // theChart.color
        theChart.chartDescription?.text = ""
        //theChart.backgroundColor = #colorLiteral(red: 0.1764492095, green: 0.1764859259, blue: 0.1850380898, alpha: 1)
        
    }
  
  func setUpChart1(){
    
    //todo convert time to hours
    let labelArray = stringTimeArray.map{$0.0}
    let monthArray = stringTimeArray.map{$0.1}
    let totalWeight = StatHelper.createTotal(timeArray: monthArray, closure: StaticDataManager.getTotalWeight(beforeDate:))
    let barColor = #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)
    StaticDataManager.setUpChart(chart: timeGraph, chartLabels: labelArray, chartValues: totalWeight,colors: [barColor],bottomLabelText: "Total Weight Lifted (lbs)")
    
    //timeGraph.xAxis.labelFont  = UIFont(name: "Simply Rounded", size: 20.0)!
    
    timeGraph.legend.font = UIFont(name: "Simply Rounded", size: 20.0)!
  }
  
  func setUpChart2(){
    let labelArray = stringTimeArray.map{$0.0}
    let monthArray = stringTimeArray.map{$0.1}
    let totalTime = StatHelper.createTotal(timeArray: monthArray, closure: StaticDataManager.getTotalTime(beforeDate:))
    
    
    StaticDataManager.setUpChart(chart: static1, chartLabels: labelArray, chartValues: totalTime,colors: [UIColor.yellow],bottomLabelText: "Total Time Working Out (hour)")
    
    //static1.xAxis.labelFont  = UIFont(name: "Simply Rounded", size: 20.0)!
    
    static1.legend.font = UIFont(name: "Simply Rounded", size: 20.0)!
  }
  
  func setUpChart3(){
    //TODO change to calories
    let monthArray = stringTimeArray.map{$0.1}
    let totalReps = StatHelper.createTotal(timeArray: monthArray , closure: StaticDataManager.getTotalReps(date:))
    let barColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
    StaticDataManager.setUpChart(chart: chartTotalReps, chartLabels: stringTimeArray.map{$0.0}, chartValues: totalReps,colors: [barColor],bottomLabelText: "Total Calories Burned")
    
    //chartTotalReps.xAxis.labelFont  = UIFont(name: "Simply Rounded", size: 20.0)!
    
    chartTotalReps.legend.font = UIFont(name: "Simply Rounded", size: 20.0)!
  }
  
  
  
  
}
