//
//  FinalPracticaViewController.swift
//  GS Sales SIM
//
//  Created by Paola Garzón on 4/8/19.
//  Copyright © 2019 Paola Garzón. All rights reserved.
//

import UIKit
import Charts
import MessageUI

class FinalPracticaViewController: UIViewController {

    @IBOutlet weak var radarChart: RadarChartView!
    @IBOutlet weak var barChart: BarChartView!
    
    //valores para grafica de radar
    let nombresRadarChart = ["C1", "C2", "C3", "C4"]
    let valoresRadarChart = [30.0, 50.0, 90.0, 60.0]
    
    //valores para grafica de barras
    let nombresBarChart = ["C1A1", "C1A2", "C1A3", "C1A4", "C1A5", "C1A6", "C1B1", "C1B2", "C1B3", "C1B4", "C1C1", "C1C2", "C1C3", "C1C4", "C1C5", "C1C6", "C1C7", "C1C8", "C2A1", "C2A2", "C2A3", "C2A4", "C2A5", "C2B1", "C2B2", "C2B3", "C2B4", "C2C1", "C2C2", "C2C3", "C3A1", "C3A2", "C3A3", "C3B1", "C3B2", "C3B3", "C3B4", "C3B5", "C3C1", "C3D1", "C3D2", "C3D3", "C3D4", "C3E1", "C3E2", "C3E3", "C3E4", "C3E5", "C3E6", "C3E7", "C4A1", "C4A2", "C4A3", "C4A4", "C4A5", "C4A6", "C4A7", "C4A8", "C4A9"]
    let valoresBarChart = [3.0, 5.0, 9.0, 8.0, 5.0, 3.0, 6.0, 2.0, 5.0, 4.0, 3.0, 5.0, 9.0, 8.0, 5.0, 3.0, 6.0, 2.0, 5.0, 4.0, 3.0, 5.0, 9.0, 8.0, 5.0, 3.0, 6.0, 2.0, 5.0, 4.0, 3.0, 5.0, 9.0, 8.0, 5.0, 3.0, 6.0, 2.0, 5.0, 4.0, 3.0, 5.0, 9.0, 8.0, 5.0, 3.0, 6.0, 2.0, 5.0, 4.0, 9.0, 3.0, 9.0, 8.0, 5.0, 3.0, 6.0, 2.0, 5.0]
    
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
    
    
    @IBAction func enviarCorreo(_ sender: Any) {
        sendEmail()
    }
    
    func sendEmail() {
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self as? MFMailComposeViewControllerDelegate
            mail.setToRecipients(["Pao_Gv93@hotmail"])
            mail.setMessageBody("<p>You're so awesome!</p>", isHTML: true)
            
            present(mail, animated: true)
        } else {
            // show failure alert
        }
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true)
    }
    
    //Funcion de la radarChart
    func setRadarChart(dataPoints: [String], values: [Double]) {
                
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
        chartDataSet.fillColor = .gray
        chartDataSet.setColor(.gray)
        
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
        
        //let cuadrantes = ["","","","C1","","","","C2","","","","C3","","","","C4","","",""]

        var dataEntries:[BarChartDataEntry] = []
        
        for i in 0..<dataPoints.count {
            let dataEntry = BarChartDataEntry(x: Double(i), yValues: [Double(values[i])])
            dataEntries.append(dataEntry)
        }
        
        let chartDataSet = BarChartDataSet(values: dataEntries, label: "valores")
        let chartData = BarChartData(dataSet: chartDataSet)
        barChart.data = chartData
        chartDataSet.setColor(.gray)

        
        barChart.xAxis.valueFormatter = IndexAxisValueFormatter(values:dataPoints)
        //barChart.xAxis.valueFormatter = IndexAxisValueFormatter(values:cuadrantes)
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
