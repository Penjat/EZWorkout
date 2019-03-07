//
//  StatVC.swift
//  EZWorkout
//
//  Created by Yilei Huang on 2019-03-04.
//  Copyright © 2019 Spencer Symington. All rights reserved.
//

import UIKit
import Charts

class StatVC: UIViewController {
    @IBOutlet weak var barChart: BarChartView!
    
    var months: [String]!
    override func viewDidLoad()
    {
        super.viewDidLoad()
        barChart.delegate = self
        barChart.noDataText = "You need to provide data for the chart."
        let unitsSold = [20.0, 4.0, 6.0, 3.0, 12.0, 16.0, 4.0, 18.0, 2.0, 4.0, 5.0, 4.0]
        months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
        setChart(dataPoints: months, values: unitsSold)
        barChart.xAxis.valueFormatter = IndexAxisValueFormatter(values: months)
        barChart.xAxis.granularity = 1
        barChart.chartDescription?.text = ""
        barChart.xAxis.labelPosition = .bottom
        
        //barChart.leftAxis.drawGridLinesEnabled = false
        barChart.rightAxis.enabled = false
        //barChart.rightAxis.drawGridLinesEnabled = false
        
        barChart.xAxis.drawGridLinesEnabled = false
        barChart.backgroundColor = UIColor(red: 189/255, green: 195/255, blue: 199/255, alpha: 1)
        let ll = ChartLimitLine(limit: 9.0, label: "Average")
        barChart.rightAxis.addLimitLine(ll)
       
    }
    override func viewDidAppear(_ animated: Bool) {
        barChart.animate(xAxisDuration: 2.0, yAxisDuration: 2.0)
    }
//    override func viewDidAppear(_ animated: Bool) {
//        barChart.animate(xAxisDuration: 2.0, yAxisDuration: 2.0)
//    }

   
    
    func setChart(dataPoints: [String], values:[Double])
    {
        //let test = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]

        var dataEntries: [BarChartDataEntry] = []

        for i in 0..<months.count
//            Double(test[i])
        {
            let dataEntry = BarChartDataEntry(x: Double(i), y: Double(values[i]))
            dataEntries.append(dataEntry)
        }

        let chartDataSet = BarChartDataSet(values: dataEntries, label: "Visitor count")
        let chartData = BarChartData(dataSet: chartDataSet)
        //chartDataSet.colors = ChartColorTemplates.joyful()
        barChart.data = chartData
    }

    @IBAction func saveButtonAction(_ sender: UIButton) {
        
        let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        
        let image = barChart.getChartImage(transparent: false)
        //imageView.image = image!
     
       // barChart.save(to: "\(documentsPath)/barChart.jpeg", format: .jpeg, compressionQuality: 1.0)
        UIImageWriteToSavedPhotosAlbum(image!, self, nil, nil)
    }
    
    @IBOutlet weak var imageView: UIImageView!
    
}

extension StatVC: ChartViewDelegate{
    func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
        print("\(entry.y) in \(months![Int(entry.x)])")
    }

}
