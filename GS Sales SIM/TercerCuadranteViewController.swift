//
//  TercerCuadranteViewController.swift
//  GS Sales SIM
//
//  Created by Paola Garzón on 4/8/19.
//  Copyright © 2019 Paola Garzón. All rights reserved.
//

import UIKit
import Charts

class TercerCuadranteViewController: UIViewController {
    
    @IBOutlet weak var radarChart: RadarChartView!
    @IBOutlet weak var barChart: BarChartView!
    
    @IBOutlet weak var btn1CheckBox: UIButton!
    @IBOutlet weak var btn2CheckBox: UIButton!
    @IBOutlet weak var btn3CheckBox: UIButton!
    
    @IBOutlet weak var recomendaciones: UILabel!
    
    //recomendaciones
    var arrayRecomendaciones = ["", "", "", "", "", "", "", "", "", "", "", "", "", ""]
    
    var fraseFinal = String()
    
    //valores para grafica de radar
    let nombresRadarChart = ["C1", "C2", "C3"]
    let valoresRadarChart = [30.0, 50.0, 90.0]
    
    //valores para grafica de barras
    let nombresBarChart = ["p1", "p2", "p3", "p4", "p5", "p6", "p7", "p8", "p9", "p10", "p11", "p12"]
    let valoresBarChart = [3.0, 5.0, 9.0, 8.0, 5.0, 3.0, 6.0, 2.0, 5.0, 4.0, 1.0, 3.0]
    
    weak var axisFormatDelegate: IAxisValueFormatter?
    
    //Para las recomendaciones iguales
    @IBOutlet weak var C3B2: UISwitch!
    @IBOutlet weak var C3B3: UISwitch!
    
    @IBOutlet weak var C3C1: UIButton!
    @IBOutlet weak var C3C2: UIButton!
    @IBOutlet weak var C3C3: UIButton!
    
    @IBOutlet weak var C3D1: UISwitch!
    @IBOutlet weak var C3D2: UISwitch!
    @IBOutlet weak var C3D3: UISwitch!
    @IBOutlet weak var C3D4: UISwitch!
    @IBOutlet weak var C3D5: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setRadarChart(dataPoints: nombresRadarChart, values: valoresRadarChart)
        let  xAxis : XAxis = self.radarChart.xAxis
        xAxis.labelFont = UIFont(name: "Arial-BoldMT", size: 14.0)!
        let  yAxis : YAxis = self.radarChart.yAxis
        yAxis.labelFont = UIFont(name: "Arial-BoldMT", size: 10.0)!
        
        axisFormatDelegate = self as? IAxisValueFormatter
        setBarChart(dataPoints: nombresBarChart, values: valoresBarChart)
        
        //tags para saber cual boton fue precionado
        btn1CheckBox.tag = 1
        btn2CheckBox.tag = 2
        btn3CheckBox.tag = 3
    }
    
    @IBAction func estadoUno(_ sender: UISwitch) {
        if (sender.isOn == true){
            arrayRecomendaciones[0] = ""
            updateRecomendaciones()
        }
        else{
            arrayRecomendaciones[0] = "Recuerda que no es lo mismo hablar con la persona que tiene los conocimientos tecnicos que con la persona que tiene como prioridad las finanzas del despacho o empresa. \n"
            updateRecomendaciones()
        }
    }
    
    @IBAction func estadoDos(_ sender: UISwitch) {
        if (sender.isOn == true){
            arrayRecomendaciones[1] = ""
            updateRecomendaciones()
        }
        else{
            arrayRecomendaciones[1] = "La identificación de las necesidades correctas del prospecto es indispensables para tener el correcto angulo de venta. ¿Hiciste suficientes preguntas correctas? \n"
            updateRecomendaciones()
        }
    }
    
    @IBAction func estadoTres(_ sender: UISwitch) {
        if (sender.isOn == true){
            arrayRecomendaciones[2] = ""
            updateRecomendaciones()
        }
        else{
            arrayRecomendaciones[2] = "No se trata de sólo ir identificando las necesidades tecnicas, ve estructurando un plan de las herramientas que podrías mostrarle que resuelvan su necesidad a traves de un BIMx. \n"
            updateRecomendaciones()
        }
    }
    
    @IBAction func estadoCuatro(_ sender: UISwitch) {
        if (sender.isOn == true){
            arrayRecomendaciones[3] = ""
            updateRecomendaciones()
        }
        else{
            arrayRecomendaciones[3] = "Lo más importante para crear una relación de confianza y credibilidad, es que sepas con quien estas hablando y lo que para el es importante en su negocio. \n"
            updateRecomendaciones()
        }
    }
    
    @IBAction func estadoCinco(_ sender: UISwitch) {
        if (C3B2.isOn == true && C3B3.isOn == true){
            arrayRecomendaciones[4] = ""
            updateRecomendaciones()
        }
        else{
            arrayRecomendaciones[4] = "Si identifico la cantidad de personas, se determina el mejor uso de ArchiCAD y beneficios. (Corroborar complejidad colaborativa, niveles de aprobación) \n"
            updateRecomendaciones()
        }
    }
    
    @IBAction func estadoSeis(_ sender: UISwitch) {
        if (sender.isOn == true){
            arrayRecomendaciones[5] = ""
            updateRecomendaciones()
        }
        else{
            arrayRecomendaciones[5] = "Recuerda que toda implementación BIM exitosa viene desde \"arriba\". \n"
            updateRecomendaciones()
        }
    }
    
    @IBAction func estadoSiete(_ sender: AnyObject) {
        if (C3C1.isSelected == false && C3C2.isSelected == false && C3C3.isSelected == false && C3D1.isOn == true && C3D2.isOn == true && C3D3.isOn == true && C3D4.isOn == true && C3D5.isOn == true){
            arrayRecomendaciones[6] = ""
            updateRecomendaciones()
        }
        else{
            arrayRecomendaciones[6] = "Entre mas preguntas hagas, mas información tendras para formular los argumentos correctos. \n"
            updateRecomendaciones()
        }
    }
    
    @IBAction func estadoOcho(_ sender: UISwitch) {
        if (sender.isOn == true){
            arrayRecomendaciones[7] = ""
            updateRecomendaciones()
        }
        else{
            arrayRecomendaciones[7] = "Investiga y muestrale a tu cliente, como empresas similares que usan ArchiCAD, han logrado desarrollar proyectos exitosos. \n"
            updateRecomendaciones()
        }
    }
    
    @IBAction func estadoNueve(_ sender: UISwitch) {
        if (sender.isOn == true){
            arrayRecomendaciones[8] = ""
            updateRecomendaciones()
        }
        else{
            arrayRecomendaciones[8] = "BIMx es la herramienta visual que nos ayuda a soportar de una forma didactica todos nuestros argumentos de venta. ¡No los desperdicies! \n"
            updateRecomendaciones()
        }
    }
    
    @IBAction func estadoDiez(_ sender: UISwitch) {
        if (sender.isOn == true){
            arrayRecomendaciones[9] = ""
            updateRecomendaciones()
        }
        else{
            arrayRecomendaciones[9] = "Dar información sobre todo nuestro entorno de productos abre las posibilidades de crecer la cuenta. \n"
            updateRecomendaciones()
        }
    }
    
    @IBAction func estadoOnce(_ sender: UISwitch) {
        if (sender.isOn == true){
            arrayRecomendaciones[10] = ""
            updateRecomendaciones()
        }
        else{
            arrayRecomendaciones[10] = "Abrir ArchiCAD sin hacer una demo, significa que probablemente no estes sentado con el tomado de desiciones. \n"
            updateRecomendaciones()
        }
    }
    
    @IBAction func estadoDoce(_ sender: UISwitch) {
        if (sender.isOn == true){
            arrayRecomendaciones[11] = ""
            updateRecomendaciones()
        }
        else{
            arrayRecomendaciones[11] = "Mencionar nuestro servicio al cliente y servicios adicionales es uno de nuestros grandes distintivos como marca. \n"
            updateRecomendaciones()
        }
    }
    
    @IBAction func estadoTrece(_ sender: UISwitch) {
        if (sender.isOn == true){
            arrayRecomendaciones[12] = ""
            updateRecomendaciones()
        }
        else{
            arrayRecomendaciones[12] = "Invitar al prospecto a que visite nuestras redes sociales, y que pueda ver nuestras campañas y videos, puede generar más interes. \n"
            updateRecomendaciones()
        }
    }
    
    @IBAction func estadoCatorce(_ sender: UISwitch) {
        if (sender.isOn == true){
            arrayRecomendaciones[13] = ""
            updateRecomendaciones()
        }
        else{
            arrayRecomendaciones[13] = "Solo si estas acompañado de alguien Técnico, es recomendable que se abra ArchiCAD y se demuestre su funcionamiento. \n"
            updateRecomendaciones()
        }
    }
    
    
    func updateRecomendaciones(){
        fraseFinal = arrayRecomendaciones[0] + arrayRecomendaciones[1] + arrayRecomendaciones[2] + arrayRecomendaciones[3] + arrayRecomendaciones[4] + arrayRecomendaciones[5] + arrayRecomendaciones[6] + arrayRecomendaciones[7] + arrayRecomendaciones[8] + arrayRecomendaciones[9] + arrayRecomendaciones[10] + arrayRecomendaciones[11] + arrayRecomendaciones[12] + arrayRecomendaciones[13]
        
        recomendaciones.text = fraseFinal
    }
    
    
    
    @IBAction func clicked(_ sender: Any) {
        switch (sender as AnyObject).tag {
        case 1:            btn1CheckBox.setImage(UIImage(named:"checkmark"), for: .normal)
        btn2CheckBox.setImage(UIImage(named:"checkmarkempty"), for: .normal)
        btn3CheckBox.setImage(UIImage(named:"checkmarkempty"), for: .normal)

        break;
        case 2:
            btn1CheckBox.setImage(UIImage(named:"checkmarkempty"), for: .normal)
            btn2CheckBox.setImage(UIImage(named:"checkmark"), for: .normal)
            btn3CheckBox.setImage(UIImage(named:"checkmarkempty"), for: .normal)
            break;
        case 3:
            btn1CheckBox.setImage(UIImage(named:"checkmarkempty"), for: .normal)
            btn2CheckBox.setImage(UIImage(named:"checkmarkempty"), for: .normal)
            btn3CheckBox.setImage(UIImage(named:"checkmark"), for: .normal)
            break;
        default:
        btn1CheckBox.setImage(UIImage(named:"checkmarkempty"), for: .normal)
        btn2CheckBox.setImage(UIImage(named:"checkmarkempty"), for: .normal)
        btn3CheckBox.setImage(UIImage(named:"checkmarkempty"), for: .normal)
        break;
        }
        
    }

    
    @IBAction func checkMarkTapped(_ sender: UIButton) {
        UIView.animate(withDuration: 0.1, delay: 0.1, options: .curveLinear, animations: {
            sender.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
            
        }) { (success) in
            UIView.animate(withDuration: 0.1, delay: 0.1, options: .curveLinear, animations: {
                sender.isSelected = !sender.isSelected
                sender.transform = .identity
            }, completion: nil)
        }
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
        radarChart.yAxis.axisMaximum = 90.0
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
        
        barChart.noDataText = "You need to provide data for the chart."
        
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
