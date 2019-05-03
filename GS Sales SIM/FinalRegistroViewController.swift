//
//  FinalRegistroViewController.swift
//  GS Sales SIM
//
//  Created by Paola Garzón on 4/8/19.
//  Copyright © 2019 Paola Garzón. All rights reserved.
//

import UIKit
import Charts

class FinalRegistroViewController: UIViewController {

    @IBOutlet weak var radarChart: RadarChartView!
    @IBOutlet weak var barChart: BarChartView!
    
    var GeneralC1 = 0.0
    var GeneralC2 = 0.0
    var GeneralC3 = 0.0
    var GeneralC4 = 0.0
    
    //valores para grafica de radar
    let nombresRadarChart = ["C1", "C2", "C3", "C4"]

    //valores para grafica de barras
    let nombresBarChart = ["C1A1", "C1A2", "C1A3", "C1A4", "C1A5", "C1A6", "C1B1", "C1B2", "C1B3", "C1B4", "C1C1", "C1C2", "C1C3", "C1C4", "C1C5", "C1C6", "C1C7", "C1C8", "C2A1", "C2A2", "C2A3", "C2A4", "C2A5", "C2B1", "C2B2", "C2B3", "C2B4", "C2C1", "C2C2", "C2C3", "C3A1", "C3A2", "C3A3", "C3B1", "C3B2", "C3B3", "C3B4", "C3B5", "C3C1", "C3D1", "C3D2", "C3D3", "C3D4", "C3E1", "C3E2", "C3E3", "C3E4", "C3E5", "C3E6", "C3E7", "C4A1", "C4A2", "C4A3", "C4A4", "C4A5", "C4A6", "C4A7", "C4A8", "C4A9"]
    let valoresBarChart = [valoresBarChartC1[0], valoresBarChartC1[1], valoresBarChartC1[2], valoresBarChartC1[3], valoresBarChartC1[4], valoresBarChartC1[5], valoresBarChartC1[6], valoresBarChartC1[7], valoresBarChartC1[8], valoresBarChartC1[9], valoresBarChartC1[10], valoresBarChartC1[11], valoresBarChartC1[12], valoresBarChartC1[13], valoresBarChartC1[14], valoresBarChartC1[15], valoresBarChartC1[16], valoresBarChartC1[17], valoresBarChartC2[0], valoresBarChartC2[1], valoresBarChartC2[2], valoresBarChartC2[3], valoresBarChartC2[4], valoresBarChartC2[5], valoresBarChartC2[6], valoresBarChartC2[7], valoresBarChartC2[8], valoresBarChartC2[9], valoresBarChartC2[10], valoresBarChartC2[11], valoresBarChartC3[0], valoresBarChartC3[1], valoresBarChartC3[2], valoresBarChartC3[3], valoresBarChartC3[4], valoresBarChartC3[5], valoresBarChartC3[6], valoresBarChartC3[7], valoresBarChartC3[8], valoresBarChartC3[9], valoresBarChartC3[10], valoresBarChartC3[11], valoresBarChartC3[12], valoresBarChartC3[13], valoresBarChartC3[14], valoresBarChartC3[15], valoresBarChartC3[16], valoresBarChartC3[17], valoresBarChartC3[18], valoresBarChartC3[19], valoresBarChartC4[0], valoresBarChartC4[1], valoresBarChartC4[2], valoresBarChartC4[3], valoresBarChartC4[4], valoresBarChartC4[5], valoresBarChartC4[6], valoresBarChartC4[7], valoresBarChartC4[8]]
    
    weak var axisFormatDelegate: IAxisValueFormatter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if(valorGeneralC1 > 0){
            GeneralC1 = Double(valorGeneralC1)
        }
        if(valorGeneralC2 > 0){
            GeneralC2 = Double(valorGeneralC2)
        }
        if(valorGeneralC3 > 0){
            GeneralC3 = Double(valorGeneralC3)
        }
        if(valorGeneralC4 > 0){
            GeneralC4 = Double(valorGeneralC4)
        }
        
        let valoresRadarChart = [GeneralC1, GeneralC2, GeneralC3, GeneralC4]
        
        setRadarChart(dataPoints: nombresRadarChart, values: valoresRadarChart)
        let  xAxis : XAxis = self.radarChart.xAxis
        xAxis.labelFont = UIFont(name: "Arial-BoldMT", size: 16.0)!
        let  yAxis : YAxis = self.radarChart.yAxis
        yAxis.labelFont = UIFont(name: "Arial-BoldMT", size: 10.0)!
        
        axisFormatDelegate = self as? IAxisValueFormatter
        setBarChart(dataPoints: nombresBarChart, values: valoresBarChart)
    }
    
    
    //Funcion de la radarChart
    func setRadarChart(dataPoints: [String], values: [Double]) {
        
        let numAprobatorio = [60.0, 55.0, 43.0, 62.0]
        
        //set de los numeros aprobatorios
        var dataEntriesA: [ChartDataEntry] = []
        for i in 0..<numAprobatorio.count {
            let dataEntryA = ChartDataEntry(x: Double(i), y: numAprobatorio[i])
            dataEntriesA.append(dataEntryA)
        }
        let chartDataSetA = RadarChartDataSet(values: dataEntriesA, label: "Número aprobatorio")
        chartDataSetA.setColor(.blue)
        
        //set de los numeros que saca el usuario
        var dataEntries: [ChartDataEntry] = []
        for i in 0..<dataPoints.count {
            let dataEntry = ChartDataEntry(x: Double(i), y: values[i])
            dataEntries.append(dataEntry)
        }
        let chartDataSet = RadarChartDataSet(values: dataEntries, label: "Calificación")
        
        //Options of radarChart
        radarChart.sizeToFit()
        radarChart.chartDescription?.text = nil
        radarChart.legend.horizontalAlignment = .center
        
        //Options for the axis from here. The range is 0-100, the interval is 10
        radarChart.yAxis.forceLabelsEnabled = true
        //radarChart.yAxis.labelCount = 10
        radarChart.yAxis.axisMinimum = 0.0
        radarChart.yAxis.axisMaximum = 100.0
        radarChart.yAxis.drawLabelsEnabled = true
        
        radarChart.rotationEnabled = false
        chartDataSet.setColor(.blue)
        chartDataSetA.setColor(.orange)
        
        //Present the number as integer
        let numberFormatter = NumberFormatter()
        numberFormatter.generatesDecimalNumbers = false
        chartDataSet.valueFormatter = numberFormatter as? IValueFormatter
        radarChart.yAxis.valueFormatter = numberFormatter as? IAxisValueFormatter
        radarChart.xAxis.valueFormatter = IndexAxisValueFormatter(values:nombresRadarChart)
        
        //Other options
        radarChart.legend.enabled = true
        radarChart.yAxis.gridAntialiasEnabled = true
        radarChart.animate(yAxisDuration: 2.0)
        
        chartDataSetA.valueFormatter = numberFormatter as? IValueFormatter
        
        //arreglo para cada dataSet
        var dataSetssss: [RadarChartDataSet] = [RadarChartDataSet]()
        
        dataSetssss.append(chartDataSetA)
        dataSetssss.append(chartDataSet)
        
        let chartData = RadarChartData(dataSets: dataSetssss)
        chartData.labels = dataPoints
        
        //Quitar el double y pasarlo a Int
        let format = NumberFormatter()
        format.numberStyle = .none
        let formatter = DefaultValueFormatter(formatter: format)
        chartData.setValueFormatter(formatter)
        
        radarChart.data = chartData
        
        radarChart.legend.font = UIFont(name: "Arial", size: 14.0)!
    }
    
    
    //Funcion de la barChart
    func setBarChart(dataPoints: [String], values: [Double]) {
        
        var dataEntries:[BarChartDataEntry] = []
        
        for i in 0..<dataPoints.count {
            let dataEntry = BarChartDataEntry(x: Double(i), yValues: [Double(values[i])])
            dataEntries.append(dataEntry)
        }
        
        let chartDataSet = BarChartDataSet(values: dataEntries, label: "Peso")
        let chartData = BarChartData(dataSet: chartDataSet)
        
        //Quitar el double y pasarlo a Int
        let format = NumberFormatter()
        format.numberStyle = .none
        let formatter = DefaultValueFormatter(formatter: format)
        chartData.setValueFormatter(formatter)
        
        barChart.data = chartData
        chartDataSet.setColor(.gray)
        
        
        barChart.xAxis.valueFormatter = IndexAxisValueFormatter(values:dataPoints)
        barChart.xAxis.granularity = 1
        
        //quita labels de arriba
        barChart.xAxis.labelPosition = .bottom
        barChart.legend.enabled = true
        barChart.xAxis.labelRotationAngle = 90
        //quitar highlight si se toca la barra
        barChart.highlighter = nil
        //Quita los numeros de lado derecho
        barChart.rightAxis.enabled = false
        
        barChart.legend.font = UIFont(name: "Arial", size: 14.0)!
    }

}
