//
//  StaticDataManager.swift
//  EZWorkout
//
//  Created by Yilei Huang on 2019-03-07.
//  Copyright © 2019 Spencer Symington. All rights reserved.
//

import Foundation
import Charts
import UIKit

class StaticDataManager{
    
    enum checkType {
        case numberOfTimes, type, weight
    }
    
    static func setUpTestData(chart: BarChartView , chartLabels:[String] , chartValues:[Int]){
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
        //chart.backgroundColor = UIColor(red: 189/255, green: 195/255, blue: 199/255, alpha: 1)
        //chart.backgroundColor = #colorLiteral(red: 0.1764492095, green: 0.1764859259, blue: 0.1850380898, alpha: 1)
        chart.xAxis.gridColor = .white
        chart.xAxis.axisLineColor = .white
        chart.xAxis.labelTextColor = .white
        chart.leftAxis.labelTextColor = .white
        //chart.backgroundColor = UIColor(white: 1, alpha: 0.5)
        let ll = ChartLimitLine(limit: 9.0, label: "Average")
        chart.rightAxis.addLimitLine(ll)
    }
   
    static func getRealmData(type:checkType)->[String:Int]{
        var emptyDict = [String:Int]()
        if(type == .numberOfTimes){
            let results = UserRealm.curUser.getAllExercises()
           
            for item in results{
                
                if emptyDict.index(forKey: item.name!) == nil {
                    emptyDict[item.name!] = 1
                } else{
                    let num = emptyDict[item.name!]
                    emptyDict.updateValue(num!+1, forKey: item.name!)
                }
            }
        }else if type == .type{
            let results = UserRealm.curUser.getAllExercises()
            for item in results{
                if(item.type == nil){
                    
                }else{
                    if emptyDict.index(forKey: item.type) == nil {
                        emptyDict[item.type] = 1
                    } else{
                        let num = emptyDict[item.type]
                        emptyDict.updateValue(num!+1, forKey: item.type)
                    }
                }
               
            }
        }
        return emptyDict
        
    }
    
    
    static func sortRealmDict(Dict:[String:Int])->[(String,Int)]{
        
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
