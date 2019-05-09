//
//  CuartoCuadranteViewController.swift
//  GS Sales SIM
//
//  Created by Paola Garzón on 4/8/19.
//  Copyright © 2019 Paola Garzón. All rights reserved.
//

import UIKit
import Charts

var valorGeneralC4: Int = 0
var valoresBarChartC4 = [-2.0, 0.0, 0.0, -4.0, 0.0, 0.0, 0.0, 0.0, 0.0]

var bonoC4 = [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0]

//recomendaciones
var arrayRecomendacionesC4 = ["- Dejar pasar demasiado tiempo entre la visita y nuestro seguimiento, puede confundirse con desinteres o informalidad. No dejes pasar más de 24 horas en contactar a tu prospecto con información de valor. \n\n", "- Que tu correo tenga agradecimiento, compromisos, cotización, plan de adquisición, casos homologos, promociones vigentes y broshure de marca. No dejar claros los siguientes pasos de tu seguimiento puede hacerlo mas dificil de programar. Siempre deja claro cuando será tu proximo contacto y cumple. \n\n"]


class CuartoCuadranteViewController: UIViewController {

    @IBOutlet weak var barChart: BarChartView!
    
    @IBOutlet weak var recomendaciones: UILabel!
    
    //nombres para grafica de barras
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
        
        updateRecomendaciones()
        
        axisFormatDelegate = self as? IAxisValueFormatter
        setBarChart(dataPoints: nombresBarChart, values: valoresBarChartC4, values2: bonoC4, sortIndex: 0)
        
        C4A1.isOn =  UserDefaults.standard.bool(forKey: "StateC4A1")
        C4A2.isOn =  UserDefaults.standard.bool(forKey: "StateC4A2")
        C4A3.isOn =  UserDefaults.standard.bool(forKey: "StateC4A3")
        C4A4.isOn =  UserDefaults.standard.bool(forKey: "StateC4A4")
        C4A5.isOn =  UserDefaults.standard.bool(forKey: "StateC4A5")
        C4A6.isOn =  UserDefaults.standard.bool(forKey: "StateC4A6")
        C4A7.isOn =  UserDefaults.standard.bool(forKey: "StateC4A7")
        C4A8.isOn =  UserDefaults.standard.bool(forKey: "StateC4A8")
        C4A9.isOn =  UserDefaults.standard.bool(forKey: "StateC4A9")
        
    }
    
    @IBAction func saveStateA1(_ sender: UISwitch) {
        UserDefaults.standard.set(sender.isOn, forKey: "StateC4A1")
    }
    
    @IBAction func saveStateA2(_ sender: UISwitch) {
        UserDefaults.standard.set(sender.isOn, forKey: "StateC4A2")
    }
    
    @IBAction func saveStateA3(_ sender: UISwitch) {
        UserDefaults.standard.set(sender.isOn, forKey: "StateC4A3")
    }
    
    @IBAction func saveStateA4(_ sender: UISwitch) {
        UserDefaults.standard.set(sender.isOn, forKey: "StateC4A4")
    }
    
    @IBAction func saveStateA5(_ sender: UISwitch) {
        UserDefaults.standard.set(sender.isOn, forKey: "StateC4A5")
    }
    
    @IBAction func saveStateA6(_ sender: UISwitch) {
        UserDefaults.standard.set(sender.isOn, forKey: "StateC4A6")
    }
    
    @IBAction func saveStateA7(_ sender: UISwitch) {
        UserDefaults.standard.set(sender.isOn, forKey: "StateC4A7")
    }
    
    @IBAction func saveStateA8(_ sender: UISwitch) {
        UserDefaults.standard.set(sender.isOn, forKey: "StateC4A8")
    }
    
    @IBAction func saveStateA9(_ sender: UISwitch) {
        UserDefaults.standard.set(sender.isOn, forKey: "StateC4A9")
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
            arrayRecomendacionesC4[0] = ""
            updateRecomendaciones()
        }
        else{
            arrayRecomendacionesC4[0] = "- Dejar pasar demasiado tiempo entre la visita y nuestro seguimiento, puede confundirse con desinteres o informalidad. No dejes pasar más de 24 horas en contactar a tu prospecto con información de valor. \n\n"
            updateRecomendaciones()
        }

        if (C4A2.isOn == true && C4A3.isOn == true && C4A4.isOn == true && C4A5.isOn == true && C4A6.isOn == true && C4A7.isOn == true && C4A8.isOn == true && C4A9.isOn == true){
            arrayRecomendacionesC4[1] = ""
            updateRecomendaciones()
        }
        else{
            arrayRecomendacionesC4[1] = "- Que tu correo tenga agradecimiento, compromisos, cotización, plan de adquisición, casos homologos, promociones vigentes y broshure de marca. No dejar claros los siguientes pasos de tu seguimiento puede hacerlo mas dificil de programar. Siempre deja claro cuando será tu proximo contacto y cumple. \n\n"
            updateRecomendaciones()
        }
    }

    func updateRecomendaciones() {
        
        recomendaciones.text = arrayRecomendacionesC4[0] + arrayRecomendacionesC4[1]
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
    }
    
    func updateCharts(){
        setBarChart(dataPoints: nombresBarChart, values: valoresBarChartC4, values2: bonoC4, sortIndex: 0)
    }
    
    //Funciones de los bonos
    @IBAction func bonos(){
        if (switchC3A2 == true && switchC3A2 == true && switchC3A2 == true && C4A1.isOn == true){
            bonoC4[0] = 2
        }else{
            bonoC4[0] = 0
        }
        if(C4A1.isOn == true && C4A4.isOn == true){
            bonoC4[3] = 1
        }else{
            bonoC4[3] = 0
        }
        if(switchC3B5 == true && C4A5.isOn == true){
            bonoC4[4] = 1
        }else{
            bonoC4[4] = 0
        }
        if(switchC3E1 == true && C4A6.isOn == true){
            bonoC4[5] = 1
        }else{
            bonoC4[5] = 0
        }
    }

    
    //Funcion de la barChart
    func setBarChart(dataPoints: [String], values: [Double], values2: [Double],sortIndex:Int) {
        
        var dataEntries:[BarChartDataEntry] = []
        
        for i in 0..<dataPoints.count {
            let dataEntry = BarChartDataEntry(x: Double(i), yValues: [Double(values[i]), Double(values2[i])])
            dataEntries.append(dataEntry)
        }
        
        let chartDataSet = BarChartDataSet(values: dataEntries, label: " ")
        chartDataSet.colors = [UIColor.blue, UIColor.orange]
        chartDataSet.stackLabels = ["Puntos", "Bono"]
        let chartData = BarChartData(dataSet: chartDataSet)
        barChart.data = chartData
        chartDataSet.drawValuesEnabled = false
        
        //Quitar el double y pasarlo a Int
        let format = NumberFormatter()
        format.numberStyle = .none
        let formatter = DefaultValueFormatter(formatter: format)
        chartData.setValueFormatter(formatter)
        
        barChart.xAxis.valueFormatter = IndexAxisValueFormatter(values:dataPoints)
        barChart.xAxis.granularity = 1
        
        //lengens en el centro
        barChart.legend.horizontalAlignment = .center
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
