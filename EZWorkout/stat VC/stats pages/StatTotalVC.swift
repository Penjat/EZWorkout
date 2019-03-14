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
        let exerciseDict = StaticDataManager.getRealmData(type: .type)
        let topSevenDict = StaticDataManager.sortRealmDict(dict: exerciseDict)
        
        updateChartData(theChart: pieChart, chartLabel: topSevenDict.map{$0.0}, data: topSevenDict.map{(arg) -> PieChartDataEntry in
            
            let (key, value) = arg
            let k = PieChartDataEntry(value:Double(value))
            return k
        })
      setUpChart1()
      setUpChart2()
      setUpChart3()
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
        let colors = [UIColor(named: "iosColor"), UIColor(named: "macColor"),UIColor.darkGray]
        dataInfo.colors = colors as![NSUIColor]
        dataInfo.entryLabelColor = .white
        
        let chartData = PieChartData(dataSet: dataInfo)
        
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
    
    StaticDataManager.setUpChart(chart: timeGraph, chartLabels: labelArray, chartValues: totalWeight,colors: [UIColor.black],bottomLabelText: "Total Weight Lifted")
    
    //timeGraph.xAxis.labelFont  = UIFont(name: "Simply Rounded", size: 20.0)!
    
    timeGraph.legend.font = UIFont(name: "Simply Rounded", size: 20.0)!
  }
  
  func setUpChart2(){
    let labelArray = stringTimeArray.map{$0.0}
    let monthArray = stringTimeArray.map{$0.1}
    let totalTime = StatHelper.createTotal(timeArray: monthArray, closure: StaticDataManager.getTotalTime(beforeDate:))
    
    
    StaticDataManager.setUpChart(chart: static1, chartLabels: labelArray, chartValues: totalTime,colors: [UIColor.yellow],bottomLabelText: "Total Time Working Out")
    
    //static1.xAxis.labelFont  = UIFont(name: "Simply Rounded", size: 20.0)!
    
    static1.legend.font = UIFont(name: "Simply Rounded", size: 20.0)!
  }
  
  func setUpChart3(){
    //TODO change to calories
    let monthArray = stringTimeArray.map{$0.1}
    let totalReps = StatHelper.createTotal(timeArray: monthArray , closure: StaticDataManager.getTotalReps(date:))
    
    StaticDataManager.setUpChart(chart: chartTotalReps, chartLabels: stringTimeArray.map{$0.0}, chartValues: totalReps,colors: [UIColor.yellow],bottomLabelText: "Total Calories Burned")
    
    //chartTotalReps.xAxis.labelFont  = UIFont(name: "Simply Rounded", size: 20.0)!
    
    chartTotalReps.legend.font = UIFont(name: "Simply Rounded", size: 20.0)!
  }
  
  
  
  
}
