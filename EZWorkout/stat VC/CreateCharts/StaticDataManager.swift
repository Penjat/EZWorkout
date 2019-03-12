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
  
  enum CheckType {
    case numberOfTimes, type, weight
  }
  
  static func setUpChart(chart: BarChartView , chartLabels:[String] , chartValues:[Int], colors:[UIColor] , bottomLabelText:String = "please provide label"){
    //chart.delegate = self
    chart.noDataText = "You need to provide data for the chart."
    
    var dataEntries: [BarChartDataEntry] = []
    
    for i in 0 ..< chartLabels.count{
      //            Double(test[i])
      
      let dataEntry = BarChartDataEntry(x: Double(i), y: Double(chartValues[i]))
      dataEntries.append(dataEntry)
    }
    
    let chartDataSet = BarChartDataSet(values: dataEntries, label: bottomLabelText)
    
    
    let chartData = BarChartData(dataSet: chartDataSet)
    chartDataSet.colors = colors//ChartColorTemplates.joyful()
    chart.data = chartData
    
    let valueLabelColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    chartData.setValueFont(UIFont(name: "Simply Rounded", size: 14))
    chartData.setValueTextColor(valueLabelColor)
    
    
    
    chart.xAxis.valueFormatter = IndexAxisValueFormatter(values: chartLabels)
    
    chart.xAxis.granularity = 1
    chart.chartDescription?.text = ""
    chart.xAxis.labelPosition = .bottom
    chart.legend.verticalAlignment = .top
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
    
    
    let leftAxis = chart.leftAxis
    leftAxis.labelFont = .systemFont(ofSize: 10, weight: .light)
    
    leftAxis.spaceTop = 0.35
    chart.drawValueAboveBarEnabled = true
    
    
    //leftAxis.inverted = true
    leftAxis.axisMinimum = 0
    
    let ll = ChartLimitLine(limit: 9.0, label: "Average")
    chart.rightAxis.addLimitLine(ll)
  }
  
  static func getRealmDataGroupedbySets()->[String:Int]{
    
    //returns a dictionary with all exercises and the number of times they have been done
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
  
  
  
  static func getRealmData(type:CheckType)->[String:Int]{
    
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
  
  
  static func sortRealmDict(dict:[String:Int])->[(String,Int)]{
    //takes a dictionary of all user exercise and how much total weight was lifted
    
    var emptyDict = [String:Int]()
    
    
    for newItem in dict{

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
    
    
    return emptyDict.sorted(by: {$0.value < $1.value})
  }
  
  
}
