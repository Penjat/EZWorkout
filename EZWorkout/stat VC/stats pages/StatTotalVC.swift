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
    
  
    @IBOutlet weak var timeGraph: BarChartView!
    @IBOutlet weak var static1: BarChartView!
  @IBOutlet weak var chartTotalReps: BarChartView!
  
    override func viewDidLoad() {
        super.viewDidLoad()
      setUpChart1()
      setUpChart2()
      setUpChart3()
    }
    func animateGraph(){
//        piePercentGraph!.animate(yAxisDuration: 1.4, easing: EasingFunctions.EaseOutBack)
//        timeGraph.animate(xAxisDuration: 2.0, yAxisDuration: 2.0)
//        static1.animate(xAxisDuration: 2.0, yAxisDuration: 2.0)
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
    
    
    StaticDataManager.setUpChart(chart: timeGraph, chartLabels: ["total time"], chartValues: [Int(StaticDataManager.getTotalTime())],colors: [UIColor.black])
    
  }
  
  func setUpChart2(){
    let chartLabels = ["total weight"]
    let totalWeight = [StaticDataManager.getTotalWeight()]
    
    StaticDataManager.setUpChart(chart: static1, chartLabels: chartLabels, chartValues: totalWeight,colors: [UIColor.yellow])
  }
  
  func setUpChart3(){
    let chartLabels = ["total reps"]
    let totalReps = [StaticDataManager.getTotalReps(date:Date())]
    
    StaticDataManager.setUpChart(chart: chartTotalReps, chartLabels: chartLabels, chartValues: totalReps,colors: [UIColor.yellow])
  }
}
