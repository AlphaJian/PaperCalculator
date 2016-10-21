//
//  ChartsViewController.swift
//  iOSChartsDemo
//
//  Created by Joyce Echessa on 6/12/15.
//  Copyright (c) 2015 Appcoda. All rights reserved.
//

import UIKit
import Charts
class ChartsViewController: UIViewController, IAxisValueFormatter {
    
   
    @IBOutlet weak var pie: PieChartView!
    @IBOutlet weak var bar: BarChartView!
    
    var months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
    
    
    let num1 = [20.0, 4.0, 6.0, 3.0, 12.0, 16.0, 4.0, 18.0, 2.0, 4.0, 5.0, 4.0]
    
    var num = [60.0, 10.0, 20.0, 15.0, 25.0]
    let month = ["90+", "80+", "70+", "60+", "60-"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if DataManager.shareManager.papersArray.count > 0 {
        
            num = [Double(DataManager.shareManager.numOf90plus), Double(DataManager.shareManager.numOf80plus), Double(DataManager.shareManager.numOf70plus), Double(DataManager.shareManager.numOf60plus), Double(DataManager.shareManager.numOf60off)]
        }
        
        // Do any additional setup after loading the view.
        pie.animate(xAxisDuration: 0.5, easingOption: .easeInBack)
        pie.chartDescription?.text = ""
        
        
        var pieArr = [ChartDataEntry]()
        for i in 0..<5 {
            let obj = PieChartDataEntry(value: num[i], label: month[i])
            pieArr.append(obj)
        }
        //        let colors = NSMutableArray()
        //        colors.addObjects(from: ChartColorTemplates.joyful())
        //        colors.addObjects(from: ChartColorTemplates.liberty())
        //        colors.addObjects(from: ChartColorTemplates.material())
        //        colors.addObjects(from: ChartColorTemplates.pastel())
        //        colors.addObjects(from: ChartColorTemplates.vordiplom())
        //        colors.addObjects(from: [UIColor.init(red: 51/255, green: 181/255, blue: 229/255, alpha: 1)])
        
        
        let dataSet1 = PieChartDataSet(values: pieArr, label: "分")
        dataSet1.sliceSpace = 2
        dataSet1.colors = ChartColorTemplates.colorful()
        
        
        let pieData = PieChartData(dataSets: [dataSet1])
//        let pFormatter = NumberFormatter()
//        pFormatter.numberStyle = .percent
//        pFormatter.maximumFractionDigits = 1
//        pFormatter.multiplier = 1.0
//        pFormatter.percentSymbol = "%"
//        pieData.setValueFormatter(DefaultValueFormatter(formatter: pFormatter))
        
        pie.data = pieData
        
       
        
        self.setBarChart()
        
        
    }
    
    func setBarChart() {
        //        bar.legend.wordWrapEnabled = true
        //        bar.legend.horizontalAlignment = .center
        //        bar.legend.verticalAlignment = .bottom
        //        bar.legend.orientation = .horizontal
        //        bar.legend.drawInside = false
        
        bar.xAxis.labelPosition = .bottom
        bar.animate(yAxisDuration: 0.5, easingOption: .easeInBack)
        bar.xAxis.axisMinimum = 0
        bar.xAxis.axisMaximum = 12
        
        bar.xAxis.centerAxisLabelsEnabled = true
        bar.xAxis.labelCount = 12
        bar.xAxis.valueFormatter = self
        bar.rightAxis.drawGridLinesEnabled = false
        bar.leftAxis.drawGridLinesEnabled = false
        bar.xAxis.drawGridLinesEnabled = false
        //        bar.leftAxis.enabled = false
        //        bar.rightAxis.enabled = true
        var arr = [ChartDataEntry]()
        
        for i in 0..<months.count {
            let dataEntry = BarChartDataEntry(x: Double(i) + 0.5, y: num1[i])
            
            arr.append(dataEntry)
        }
        
        let dataSet = BarChartDataSet(values: arr, label: "Month")
        
        let barData = BarChartData(dataSet: dataSet)
        dataSet.colors = ChartColorTemplates.colorful()
        bar.chartDescription?.text = ""
        bar.data = barData
    }
    func stringForValue(_ value: Double, axis: AxisBase?) -> String {
        
        if value < 12 && value >= 0 {
            return months[Int(value)]
        }
        else {
            return ""
        }
    }
    
    
    
}
