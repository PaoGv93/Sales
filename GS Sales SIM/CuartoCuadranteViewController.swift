//
//  CuartoCuadranteViewController.swift
//  GS Sales SIM
//
//  Created by Paola Garzón on 4/8/19.
//  Copyright © 2019 Paola Garzón. All rights reserved.
//

import UIKit
import Charts

var valorGeneralC4: Int = 100
var valoresBarChartC4 = [5.0, 2.0, 3.0, 4.0, 3.0, 2.0, 2.0, 1.0, 4.0]


class CuartoCuadranteViewController: UIViewController {

    @IBOutlet weak var barChart: BarChartView!
    
    @IBOutlet weak var recomendaciones: UILabel!
    
    //recomendaciones
    var arrayRecomendaciones = ["", ""]
    
    var fraseFinal = String()
    
    //valores para grafica de barras
    let nombresBarChart = ["A1", "A2", "A3", "A4", "A5", "A6", "A7", "A8", "A9"]
    
    weak var axisFormatDelegate: IAxisValueFormatter?
    
    @IBOutlet weak var C4A1: UISwitch!
    @IBOutlet weak var C4A2: UISwitch!
    @IBOutlet weak var C4A3: UISwitch!
    @IBOutlet weak var C4A4: UISwitch!
    @IBOutlet weak var C4A5: UISwitch!
    @IBOutlet weak var C4A6: UISwitch!
    @IBOutlet weak var C4A7: UISwitch!
    @IBOutlet weak var C4A8: UISwitch!
    @IBOutlet weak var C4A9: UISwitch!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        axisFormatDelegate = self as? IAxisValueFormatter
        setBarChart(dataPoints: nombresBarChart, values: valoresBarChartC4)
    }
    
    @IBAction func siguiente(_ sender: Any) {
        
        let valor = botonElegido

        if(valor == 1){
            performSegue(withIdentifier: "finalPractica", sender: self)

        }else if(valor == 2) {
            performSegue(withIdentifier: "finalRegistro", sender: self)

        }
    }
    
    //FUNCIONES PARA LAS RECOMENDACIONES
    @IBAction func Recomendaciones(_ sender: UISwitch) {
        if (C4A1.isOn == true){
            arrayRecomendaciones[0] = ""
            updateRecomendaciones()
        }
        else{
            arrayRecomendaciones[0] = "- Dejar pasar demasiado tiempo entre la visita y nuestro seguimiento, puede confundirse con desinteres o informalidad. No dejes pasar más de 24 horas en contactar a tu prospecto con información de valor. \n\n"
            updateRecomendaciones()
        }

        if (C4A2.isOn == true && C4A3.isOn == true && C4A4.isOn == true && C4A5.isOn == true && C4A6.isOn == true && C4A7.isOn == true && C4A8.isOn == true && C4A9.isOn == true){
            arrayRecomendaciones[1] = ""
            updateRecomendaciones()
        }
        else{
            arrayRecomendaciones[1] = "- Que tu correo tenga agradecimiento, compromisos, cotización, plan de adquisición, casos homologos, promociones vigentes y broshure de marca. No dejar claros los siguientes pasos de tu seguimiento puede hacerlo mas dificil de programar. Siempre deja claro cuando será tu proximo contacto y cumple. \n\n"
            updateRecomendaciones()
        }
    }

    func updateRecomendaciones() {
        fraseFinal = arrayRecomendaciones[0] + arrayRecomendaciones[1]
        
        recomendaciones.text = fraseFinal
    }
    
    @IBAction func updateValor(_ sender: UISwitch){
        if(C4A1.isOn == true){
            valoresBarChartC4[0] = 5
            updateCharts()
        }
        else{
            valoresBarChartC4[0] = -2
            updateCharts()
        }
        if(C4A2.isOn == true){
            valoresBarChartC4[1] = 2
            updateCharts()
        }
        else{
            valoresBarChartC4[1] = 0
            updateCharts()
        }
        if(C4A3.isOn == true){
            valoresBarChartC4[2] = 3
            updateCharts()
        }
        else{
            valoresBarChartC4[2] = 0
            updateCharts()
        }
        if(C4A4.isOn == true){
            valoresBarChartC4[3] = 4
            updateCharts()
        }
        else{
            valoresBarChartC4[3] = -4
            updateCharts()
        }
        if(C4A5.isOn == true){
            valoresBarChartC4[4] = 3
            updateCharts()
        }
        else{
            valoresBarChartC4[4] = 0
            updateCharts()
        }
        if(C4A6.isOn == true){
            valoresBarChartC4[5] = 2
            updateCharts()
        }
        else{
            valoresBarChartC4[5] = 0
            updateCharts()
        }
        if(C4A7.isOn == true){
            valoresBarChartC4[6] = 2
            updateCharts()
        }
        else{
            valoresBarChartC4[6] = 0
            updateCharts()
        }
        if(C4A8.isOn == true){
            valoresBarChartC4[7] = 1
            updateCharts()
        }
        else{
            valoresBarChartC4[7] = 0
            updateCharts()
        }
        if(C4A9.isOn == true){
            valoresBarChartC4[8] = 4
            updateCharts()
        }
        else{
            valoresBarChartC4[8] = 0
            updateCharts()
        }
        
        valorGeneralC4 = Int((((valoresBarChartC4[0] + valoresBarChartC4[1] + valoresBarChartC4[2] + valoresBarChartC4[3] + valoresBarChartC4[4] + valoresBarChartC4[5] + valoresBarChartC4[6] + valoresBarChartC4[7] + valoresBarChartC4[8]) * 100) / 26))
        print(valorGeneralC4)
    }
    
    func updateCharts(){
        setBarChart(dataPoints: nombresBarChart, values: valoresBarChartC4)
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
        //quitar highlight si se toca la barra
        barChart.highlighter = nil
        //Quita los numeros de lado derecho
        barChart.rightAxis.enabled = false
        
        barChart.legend.font = UIFont(name: "Arial", size: 14.0)!
    }
    
}
