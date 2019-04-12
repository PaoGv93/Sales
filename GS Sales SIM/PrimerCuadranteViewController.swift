//
//  PrimerCuadranteViewController.swift
//  GS Sales SIM
//
//  Created by Paola Garzón on 4/8/19.
//  Copyright © 2019 Paola Garzón. All rights reserved.
//

import UIKit
import Charts

class PrimerCuadranteViewController: UIViewController {

    @IBOutlet weak var radarChartView: RadarChartView!
    @IBOutlet weak var barChart: BarChartView!
    
    //los valores son los mismos parar las dos graficas
    let months = ["January", "Febrary", "March", "April", "May"]
    let unitsSold = [30.0, 50.0, 100.0, 75.0, 85.0]
    
    weak var axisFormatDelegate: IAxisValueFormatter?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setRadarChart(dataPoints: months, values: unitsSold)
        let  xAxis : XAxis = self.radarChartView.xAxis
        xAxis.labelFont = UIFont(name: "Arial-BoldMT", size: 14.0)!
        let  yAxis : YAxis = self.radarChartView.yAxis
        yAxis.labelFont = UIFont(name: "Arial-BoldMT", size: 10.0)!
        
        
        axisFormatDelegate = self as? IAxisValueFormatter
        setBarChart(dataEntryX: months, dataEntryY: unitsSold)
        
    }
    
    //Funcion de la radarChart
    func setRadarChart(dataPoints: [String], values: [Double]) {
        radarChartView.noDataText = "You need to provide data for the chart."
        
        var dataEntries: [ChartDataEntry] = []
        for i in 0..<dataPoints.count {
            let dataEntry = ChartDataEntry(x: Double(i), y: values[i])
            dataEntries.append(dataEntry)
        }
        let chartDataSet = RadarChartDataSet(values: dataEntries, label: "Units Sold")
        
        //Options of radarChart
        radarChartView.sizeToFit()
        radarChartView.chartDescription?.text = ""
        
        //Options for the axis from here. The range is 0-100, the interval is 10
        radarChartView.yAxis.forceLabelsEnabled = true
        radarChartView.yAxis.labelCount = 10
        radarChartView.yAxis.axisMaximum = 80.0
        radarChartView.yAxis.axisMinimum = 0
        radarChartView.yAxis.drawLabelsEnabled = true
        
        radarChartView.rotationEnabled = false
        chartDataSet.drawFilledEnabled = true
        
        //Present the number as integer
        let numberFormatter = NumberFormatter()
        numberFormatter.generatesDecimalNumbers = false
        chartDataSet.valueFormatter = numberFormatter as? IValueFormatter
        radarChartView.yAxis.valueFormatter = numberFormatter as? IAxisValueFormatter
        radarChartView.xAxis.valueFormatter = IndexAxisValueFormatter(values:months)
        
        //Other options
        radarChartView.legend.enabled = false
        radarChartView.yAxis.gridAntialiasEnabled = true
        radarChartView.animate(yAxisDuration: 1.0)
        
        let chartData = RadarChartData(dataSet: chartDataSet)
        chartData.labels = dataPoints
        radarChartView.data = chartData
    }
    
    
    //Funcion de la barChart
    func setBarChart(dataEntryX forX:[String],dataEntryY forY: [Double]) {
        barChart.noDataText = "You need to provide data for the chart."
        
        var dataEntries:[BarChartDataEntry] = []
        for i in 0..<forX.count{
            let dataEntry = BarChartDataEntry(x: Double(i), y: Double(forY[i]) , data: months as AnyObject?)
            dataEntries.append(dataEntry)
        }
        
        let chartDataSet = BarChartDataSet(values: dataEntries, label: "Units Sold")
        let chartData = BarChartData(dataSet: chartDataSet)
        barChart.data = chartData
        let xAxisValue = barChart.xAxis
        xAxisValue.valueFormatter = axisFormatDelegate
    }

}
