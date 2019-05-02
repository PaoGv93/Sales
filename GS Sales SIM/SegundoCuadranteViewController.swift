//
//  SegundoCuadranteViewController.swift
//  GS Sales SIM
//
//  Created by Paola Garzón on 4/8/19.
//  Copyright © 2019 Paola Garzón. All rights reserved.
//

import UIKit
import Charts

class SegundoCuadranteViewController: UIViewController {
    
    @IBOutlet weak var radarChart: RadarChartView!
    @IBOutlet weak var barChart: BarChartView!
    @IBOutlet weak var recomendaciones: UITextView!
    
    //recomendaciones
    var arrayRecomendaciones = ["", "", "", "", "", "", "", "", ""]
    
    var fraseFinal = String()

    
    //valores para grafica de radar
    let nombresRadarChart = ["A", "B", "C"]
    var valoresRadarChart = [100.0, 100.0, 100.0]
    
    //valores para grafica de barras
    let nombresBarChart = ["A1", "A2", "A3", "A4", "A5", "B1", "B2", "B3", "B4", "C1", "C2", "C3"]
    var valoresBarChart = [1.0, 2.0, 2.0, 2.0, 5.0, 5.0, 2.0, 1.0, 1.0, 2.0, 3.0, 3.0]
    
    weak var axisFormatDelegate: IAxisValueFormatter?
    
    @IBOutlet weak var C2A1: UISwitch!
    @IBOutlet weak var C2A2: UISwitch!
    @IBOutlet weak var C2A3: UISwitch!
    @IBOutlet weak var C2A4: UISwitch!
    @IBOutlet weak var C2A5: UISwitch!
    @IBOutlet weak var C2B1: UISwitch!
    @IBOutlet weak var C2B2: UISwitch!
    @IBOutlet weak var C2B3: UISwitch!
    @IBOutlet weak var C2B4: UISwitch!
    @IBOutlet weak var C2C1: UISwitch!
    @IBOutlet weak var C2C2: UISwitch!
    @IBOutlet weak var C2C3: UISwitch!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setRadarChart(dataPoints: nombresRadarChart, values: valoresRadarChart)
        let  xAxis : XAxis = self.radarChart.xAxis
        xAxis.labelFont = UIFont(name: "Arial-BoldMT", size: 16.0)!
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
            arrayRecomendaciones[0] = "- Como nos vemos predispone a nuestro prospecto a sentir afinidad por nosotros y lo que tenemos que decir. Recuerda ir vestido de acuerdo al contexto. \n\n"
            updateRecomendaciones()
        }
    }
    
    @IBAction func estadoDos(_ sender: UISwitch) {
        if (sender.isOn == true){
            arrayRecomendaciones[1] = ""
            updateRecomendaciones()
        }
        else{
            arrayRecomendaciones[1] = "- Para asegurar una presentación efectiva, recuerda asegurarte de cuanto tiempo para presentar, y que no por una confusión de tiempo, pierdas la oportunidad de hacer una entrevista de impacto. \n\n"
            updateRecomendaciones()
        }
    }
    
    @IBAction func estadoTres(_ sender: UISwitch) {
        if (C2A3.isOn == true && C2B2.isOn == true){
            arrayRecomendaciones[2] = ""
            updateRecomendaciones()
        }
        else{
            arrayRecomendaciones[2] = "- No dejes que un descuido te arruine una oportunidad de venta. Recuerda llevar todo lo que necesites, desde un Ipad, los adaptadores que puedas necesitar, llevar tu material de trabajo cargado etc. \n\n"
            updateRecomendaciones()
        }
    }
    
    @IBAction func estadoCuatro(_ sender: UISwitch) {
        if (sender.isOn == true){
            arrayRecomendaciones[3] = ""
            updateRecomendaciones()
        }
        else{
            arrayRecomendaciones[3] = "- ¿Pudiste constatar que lo que investigaste es congruente con lo que viste cuando entraste al despacho? Recuerda que todo prospecto requiere tiempo, y ese tiempo depende tambien de la inversión, aunque no hay cliente pequeño. \n\n"
            updateRecomendaciones()
        }
    }
    
    @IBAction func estadoCinco(_ sender: UISwitch) {
        if (sender.isOn == true){
            arrayRecomendaciones[4] = ""
            updateRecomendaciones()
        }
        else{
            arrayRecomendaciones[4] = "- Descubre la modalidad en la que puedo hacerlo mi cliente (Renta de 12 o Full). \n\n"
            updateRecomendaciones()
        }
    }
    
    @IBAction func estadoSeis(_ sender: UISwitch) {
        if (sender.isOn == true){
            arrayRecomendaciones[5] = ""
            updateRecomendaciones()
        }
        else{
            arrayRecomendaciones[5] = "- No tener una buena tecnica rompe hielo, puede costarte la calidad de la presentación. Recuerda siempre decir algo agradable sobre el contexto en el que te encuentras. \n\n"
            updateRecomendaciones()
        }
    }
    
    @IBAction func estadoSiete(_ sender: UISwitch) {
        if (sender.isOn == true){
            arrayRecomendaciones[6] = ""
            updateRecomendaciones()
        }
        else{
            arrayRecomendaciones[6] = "- Presta atención al ambiente y entorno de la empresa y usalo para resaltar los aspectos positivos que identifiques. \n\n"
            updateRecomendaciones()
        }
    }
    
    @IBAction func estadoOcho(_ sender: UISwitch) {
        if (C2B4.isOn == true && C2C3.isOn == true){
            arrayRecomendaciones[7] = ""
            updateRecomendaciones()
        }
        else{
            arrayRecomendaciones[7] = "- Identifica algo positivo a mencionar sobre el cliente y usalo para establecer un vinculo con el cliente. \n\n"
            updateRecomendaciones()
        }
    }
    
    @IBAction func estadoNueve(_ sender: UISwitch) {
        if (sender.isOn == true){
            arrayRecomendaciones[8] = ""
            updateRecomendaciones()
        }
        else{
            arrayRecomendaciones[8] = "- Para vender, siempre es mas importante escuchar. \n\n"
            updateRecomendaciones()
        }
    }
    
    func updateRecomendaciones(){
        fraseFinal = arrayRecomendaciones[0] + arrayRecomendaciones[1] + arrayRecomendaciones[2] + arrayRecomendaciones[3] + arrayRecomendaciones[4] + arrayRecomendaciones[5] + arrayRecomendaciones[6] + arrayRecomendaciones[7] + arrayRecomendaciones[8]
        
        recomendaciones.text = fraseFinal
    }
    
    
    //FUNCIONES PARA EL CALCULO
    @IBAction func updateValor(_ sender: UISwitch){
        if(C2A1.isOn == true){
            valoresBarChart[0] = 1
            updateCharts()
        }
        else{
            valoresBarChart[0] = 0
            updateCharts()
        }
        if(C2A2.isOn == true){
            valoresBarChart[1] = 2
            updateCharts()
        }
        else{
            valoresBarChart[1] = 0
            updateCharts()
        }
        if(C2A3.isOn == true){
            valoresBarChart[2] = 2
            updateCharts()
        }
        else{
            valoresBarChart[2] = 0
            updateCharts()
        }
        if(C2A4.isOn == true){
            valoresBarChart[3] = 2
            updateCharts()
        }
        else{
            valoresBarChart[3] = -2
            updateCharts()
        }
        if(C2A5.isOn == true){
            valoresBarChart[4] = 5
            updateCharts()
        }
        else{
            valoresBarChart[4] = 0
            updateCharts()
        }
        if(C2B1.isOn == true){
            valoresBarChart[5] = 5
            updateCharts()
        }
        else{
            valoresBarChart[5] = 0
            updateCharts()
        }
        if(C2B2.isOn == true){
            valoresBarChart[6] = 2
            updateCharts()
        }
        else{
            valoresBarChart[6] = 0
            updateCharts()
        }
        if(C2B3.isOn == true){
            valoresBarChart[7] = 1
            updateCharts()
        }
        else{
            valoresBarChart[7] = 0
            updateCharts()
        }
        if(C2B4.isOn == true){
            valoresBarChart[8] = 1
            updateCharts()
        }
        else{
            valoresBarChart[8] = 0
            updateCharts()
        }
        if(C2C1.isOn == true){
            valoresBarChart[9] = 2
            updateCharts()
        }
        else{
            valoresBarChart[9] = 0
            updateCharts()
        }
        if(C2C2.isOn == true){
            valoresBarChart[10] = 3
            updateCharts()
        }
        else{
            valoresBarChart[10] = -3
            updateCharts()
        }
        if(C2C3.isOn == true){
            valoresBarChart[11] = 3
            updateCharts()
        }
        else{
            valoresBarChart[11] = 0
            updateCharts()
        }
        
        //Para los cuadrantes en RadarChart
        let valorA = (((valoresBarChart[0] + valoresBarChart[1] + valoresBarChart[2] + valoresBarChart[3] + valoresBarChart[4]) * 100) / 12)
        if(valorA > 0){
            valoresRadarChart[0] = valorA
        }else{
            valoresRadarChart[0] = 0
        }
        
        let valorB = (((valoresBarChart[5] + valoresBarChart[6] + valoresBarChart[7] + valoresBarChart[8]) * 100) / 9)
        if(valorB > 0){
            valoresRadarChart[1] = valorB
        }else{
            valoresRadarChart[1] = 0
        }
        
        let valorC = (((valoresBarChart[9] + valoresBarChart[10] + valoresBarChart[11]) * 100) / 8)
        if(valorC > 0){
            valoresRadarChart[2] = valorC
        }else{
            valoresRadarChart[2] = 0
        }
        updateCharts()
        
    }
    
    func updateCharts(){
        setBarChart(dataPoints: nombresBarChart, values: valoresBarChart)
        setRadarChart(dataPoints: nombresRadarChart, values: valoresRadarChart)
    }
    
   
    //Funcion de la radarChart
    func setRadarChart(dataPoints: [String], values: [Double]) {
        
        let numAprobatorio = [50.0, 78.0, 38.0]
        
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
        radarChart.setExtraOffsets(left: 0, top: 10, right: 0, bottom: -100)
        radarChart.legend.yOffset = 50
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
        //quitar highlight si se toca la barra
        barChart.highlighter = nil
        //Quita los numeros de lado derecho
        barChart.rightAxis.enabled = false
        
        barChart.legend.font = UIFont(name: "Arial", size: 14.0)!
    }
    

}
