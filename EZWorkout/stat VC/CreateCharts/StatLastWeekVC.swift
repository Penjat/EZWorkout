//
//  StatLastWeekVC.swift
//  EZWorkout
//
//  Created by Yilei Huang on 2019-03-10.
//  Copyright © 2019 Spencer Symington. All rights reserved.
//

import UIKit
import Charts

class StatLastWeekVC: UIViewController {
    
    
    @IBOutlet weak var caloryGraph: BarChartView!
    @IBOutlet weak var weightGraph: BarChartView!
    @IBOutlet weak var timeGraph: BarChartView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let exerciseDict = StaticDataManager.getRealmData(type: .numberOfTimes)
        let topSevenDict = StaticDataManager.sortRealmDict(dict: exerciseDict)
      StaticDataManager.setUpChart(chart: caloryGraph, chartLabels: exerciseDict.map{$0.0}, chartValues: topSevenDict.map{$0.1},colors: [UIColor.black])
        StaticDataManager.setUpChart(chart: timeGraph, chartLabels: exerciseDict.map{$0.0}, chartValues: topSevenDict.map{$0.1},colors: [UIColor.black])
        StaticDataManager.setUpChart(chart: weightGraph, chartLabels: exerciseDict.map{$0.0}, chartValues: topSevenDict.map{$0.1},colors: [UIColor.black])
       
    }
    



}
