//
//  CuartoCuadranteViewController.swift
//  GS Sales SIM
//
//  Created by Paola Garzón on 4/8/19.
//  Copyright © 2019 Paola Garzón. All rights reserved.
//

import UIKit
import Charts

class CuartoCuadranteViewController: UIViewController {

    @IBOutlet weak var radarChart: RadarChartView!
    @IBOutlet weak var barChart: BarChartView!
    
    @IBOutlet weak var recomendaciones: UILabel!
    
    //recomendaciones
    var arrayRecomendaciones = ["", "", "", "", "", "", "", "", ""]
    
    var fraseFinal = String()
    
    //valores para grafica de radar
    let nombresRadarChart = ["C1", "C2", "C3"]
    let valoresRadarChart = [30.0, 50.0, 90.0]
    
    //valores para grafica de barras
    let nombresBarChart = ["p1", "p2", "p3", "p4", "p5", "p6", "p7", "p8", "p9", "p10", "p11", "p12"]
    let valoresBarChart = [3.0, 5.0, 9.0, 8.0, 5.0, 3.0, 6.0, 2.0, 5.0, 4.0, 1.0, 3.0]
    
    weak var axisFormatDelegate: IAxisValueFormatter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setRadarChart(dataPoints: nombresRadarChart, values: valoresRadarChart)
        let  xAxis : XAxis = self.radarChart.xAxis
        xAxis.labelFont = UIFont(name: "Arial-BoldMT", size: 14.0)!
        let  yAxis : YAxis = self.radarChart.yAxis
        yAxis.labelFont = UIFont(name: "Arial-BoldMT", size: 10.0)!
        
        axisFormatDelegate = self as? IAxisValueFormatter
        setBarChart(dataPoints: nombresBarChart, values: valoresBarChart)
    }
    
    @IBAction func estadoUno(_ sender: UISwitch) {
        if (sender.isOn == true){
            arrayRecomendaciones[0] = ""
            updateRecomendaciones()
        }
        else{
            arrayRecomendaciones[0] = "0 \n"
            updateRecomendaciones()
        }
    }
    
    @IBAction func estadoDos(_ sender: UISwitch) {
        if (sender.isOn == true){
            arrayRecomendaciones[1] = ""
            updateRecomendaciones()
        }
        else{
            arrayRecomendaciones[1] = "1 \n"
            updateRecomendaciones()
        }
    }
    
    @IBAction func estadoTres(_ sender: UISwitch) {
        if (sender.isOn == true){
            arrayRecomendaciones[2] = ""
            updateRecomendaciones()
        }
        else{
            arrayRecomendaciones[2] = "2 \n"
            updateRecomendaciones()
        }
    }
    
    @IBAction func estadoCuatro(_ sender: UISwitch) {
        if (sender.isOn == true){
            arrayRecomendaciones[3] = ""
            updateRecomendaciones()
        }
        else{
            arrayRecomendaciones[3] = "3 \n"
            updateRecomendaciones()
        }
    }
    
    @IBAction func estadoCinco(_ sender: UISwitch) {
        if (sender.isOn == true){
            arrayRecomendaciones[4] = ""
            updateRecomendaciones()
        }
        else{
            arrayRecomendaciones[4] = "4 \n"
            updateRecomendaciones()
        }
    }
    
    @IBAction func estadoSeis(_ sender: UISwitch) {
        if (sender.isOn == true){
            arrayRecomendaciones[5] = ""
            updateRecomendaciones()
        }
        else{
            arrayRecomendaciones[5] = "5 \n"
            updateRecomendaciones()
        }
    }
    
    @IBAction func estadoSiete(_ sender: UISwitch) {
        if (sender.isOn == true){
            arrayRecomendaciones[6] = ""
            updateRecomendaciones()
        }
        else{
            arrayRecomendaciones[6] = "6 \n"
            updateRecomendaciones()
        }
    }
    
    @IBAction func estadoOcho(_ sender: UISwitch) {
        if (sender.isOn == true){
            arrayRecomendaciones[7] = ""
            updateRecomendaciones()
        }
        else{
            arrayRecomendaciones[7] = "7 \n"
            updateRecomendaciones()
        }
    }
    
    @IBAction func estadoNueve(_ sender: UISwitch) {
        if (sender.isOn == true){
            arrayRecomendaciones[8] = ""
            updateRecomendaciones()
        }
        else{
            arrayRecomendaciones[8] = "8 \n"
            updateRecomendaciones()
        }
    }
    
    func updateRecomendaciones(){
        fraseFinal = arrayRecomendaciones[0] + arrayRecomendaciones[1] + arrayRecomendaciones[2] + arrayRecomendaciones[3] + arrayRecomendaciones[4] + arrayRecomendaciones[5] + arrayRecomendaciones[6] + arrayRecomendaciones[7] + arrayRecomendaciones[8]
        
        recomendaciones.text = fraseFinal
    }
    
    
    //Funcion de la radarChart
    func setRadarChart(dataPoints: [String], values: [Double]) {
        radarChart.noDataText = "You need to provide data for the chart."
        
        var dataEntries: [ChartDataEntry] = []
        for i in 0..<dataPoints.count {
            let dataEntry = ChartDataEntry(x: Double(i), y: values[i])
            dataEntries.append(dataEntry)
        }
        let chartDataSet = RadarChartDataSet(values: dataEntries, label: "valores")
        
        //Options of radarChart
        radarChart.sizeToFit()
        radarChart.chartDescription?.text = ""
        
        //Options for the axis from here. The range is 0-100, the interval is 10
        radarChart.yAxis.forceLabelsEnabled = true
        radarChart.yAxis.labelCount = 10
        radarChart.yAxis.axisMinimum = 0.0
        radarChart.yAxis.axisMaximum = 80.0
        radarChart.yAxis.drawLabelsEnabled = true
        
        radarChart.rotationEnabled = false
        chartDataSet.drawFilledEnabled = true
        
        //Present the number as integer
        let numberFormatter = NumberFormatter()
        numberFormatter.generatesDecimalNumbers = false
        chartDataSet.valueFormatter = numberFormatter as? IValueFormatter
        radarChart.yAxis.valueFormatter = numberFormatter as? IAxisValueFormatter
        radarChart.xAxis.valueFormatter = IndexAxisValueFormatter(values:nombresRadarChart)
        
        //Other options
        radarChart.legend.enabled = false
        radarChart.yAxis.gridAntialiasEnabled = true
        radarChart.animate(yAxisDuration: 2.0)
        
        let chartData = RadarChartData(dataSet: chartDataSet)
        chartData.labels = dataPoints
        radarChart.data = chartData
    }
    
    
    //Funcion de la barChart
    func setBarChart(dataPoints: [String], values: [Double]) {
        
        barChart.noDataText = "You need to provide data for the chart."
        
        var dataEntries:[BarChartDataEntry] = []
        
        for i in 0..<dataPoints.count {
            let dataEntry = BarChartDataEntry(x: Double(i), yValues: [Double(values[i])])
            dataEntries.append(dataEntry)
        }
        
        let chartDataSet = BarChartDataSet(values: dataEntries, label: "valores")
        let chartData = BarChartData(dataSet: chartDataSet)
        barChart.data = chartData
        
        barChart.xAxis.valueFormatter = IndexAxisValueFormatter(values:dataPoints)
        barChart.xAxis.granularity = 1
        
        //quita labels de arriba
        barChart.xAxis.labelPosition = .bottom
        barChart.legend.enabled = false
        //quitar highlight si se toca la barra
        barChart.highlighter = nil
        //Quita los numeros de lado derecho
        barChart.rightAxis.enabled = false
    }
    
}
