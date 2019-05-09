//
//  SegundoCuadranteViewController.swift
//  GS Sales SIM
//
//  Created by Paola Garzón on 4/8/19.
//  Copyright © 2019 Paola Garzón. All rights reserved.
//

import UIKit
import Charts

var valorGeneralC2: Int = 0
var valoresRadarChartC2 = [0.0, 0.0, 0.0]
var valoresBarChartC2 = [0.0, 0.0, 0.0, -2.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, -3.0, 0.0]

var bonoC2 = [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0]

//recomendaciones
var arrayRecomendacionesC2 = ["- Como nos vemos predispone a nuestro prospecto a sentir afinidad por nosotros y lo que tenemos que decir. Recuerda ir vestido de acuerdo al contexto. \n\n", "- Para asegurar una presentación efectiva, recuerda asegurarte de cuanto tiempo para presentar, y que no por una confusión de tiempo, pierdas la oportunidad de hacer una entrevista de impacto. \n\n", "- No dejes que un descuido te arruine una oportunidad de venta. Recuerda llevar todo lo que necesites, desde un Ipad, los adaptadores que puedas necesitar, llevar tu material de trabajo cargado etc. \n\n", "- ¿Pudiste constatar que lo que investigaste es congruente con lo que viste cuando entraste al despacho? Recuerda que todo prospecto requiere tiempo, y ese tiempo depende tambien de la inversión, aunque no hay cliente pequeño. \n\n", "- Descubre la modalidad en la que puedo hacerlo mi cliente (Renta de 12 o Full). \n\n", "- No tener una buena tecnica rompe hielo, puede costarte la calidad de la presentación. Recuerda siempre decir algo agradable sobre el contexto en el que te encuentras. \n\n", "- Presta atención al ambiente y entorno de la empresa y usalo para resaltar los aspectos positivos que identifiques. \n\n", "- Identifica algo positivo a mencionar sobre el cliente y usalo para establecer un vinculo con el cliente. \n\n", "- Para vender, siempre es mas importante escuchar. \n\n"]

//valores para validar los bonos en otros viewControllers
var switchC2A4: Bool = true


class SegundoCuadranteViewController: UIViewController {
    
    @IBOutlet weak var radarChart: RadarChartView!
    @IBOutlet weak var barChart: BarChartView!
    @IBOutlet weak var recomendaciones: UITextView!
    
    //nombres para las graficas
    let nombresRadarChart = ["A", "B", "C"]
    let nombresBarChart = ["A1", "A2", "A3", "A4", "A5", "B1", "B2", "B3", "B4", "C1", "C2", "C3"]
    
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
        
        updateRecomendaciones()
        
        setRadarChart(dataPoints: nombresRadarChart, values: valoresRadarChartC2)
        let  xAxis : XAxis = self.radarChart.xAxis
        xAxis.labelFont = UIFont(name: "Arial-BoldMT", size: 16.0)!
        let  yAxis : YAxis = self.radarChart.yAxis
        yAxis.labelFont = UIFont(name: "Arial-BoldMT", size: 10.0)!
        
        axisFormatDelegate = self as? IAxisValueFormatter
        setBarChart(dataPoints: nombresBarChart, values: valoresBarChartC2, values2: bonoC2, sortIndex: 0)

        C2A1.isOn =  UserDefaults.standard.bool(forKey: "StateC2A1")
        C2A2.isOn =  UserDefaults.standard.bool(forKey: "StateC2A2")
        C2A3.isOn =  UserDefaults.standard.bool(forKey: "StateC2A3")
        C2A4.isOn =  UserDefaults.standard.bool(forKey: "StateC2A4")
        C2A5.isOn =  UserDefaults.standard.bool(forKey: "StateC2A5")
        C2B1.isOn =  UserDefaults.standard.bool(forKey: "StateC2B1")
        C2B2.isOn =  UserDefaults.standard.bool(forKey: "StateC2B2")
        C2B3.isOn =  UserDefaults.standard.bool(forKey: "StateC2B3")
        C2B4.isOn =  UserDefaults.standard.bool(forKey: "StateC2B4")
        C2C1.isOn =  UserDefaults.standard.bool(forKey: "StateC2C1")
        C2C2.isOn =  UserDefaults.standard.bool(forKey: "StateC2C2")
        C2C3.isOn =  UserDefaults.standard.bool(forKey: "StateC2C3")
        
    }
    
    @IBAction func saveStateA1(_ sender: UISwitch) {
        UserDefaults.standard.set(sender.isOn, forKey: "StateC2A1")
    }
    
    @IBAction func saveStateA2(_ sender: UISwitch) {
        UserDefaults.standard.set(sender.isOn, forKey: "StateC2A2")
    }
    
    @IBAction func saveStateA3(_ sender: UISwitch) {
        UserDefaults.standard.set(sender.isOn, forKey: "StateC2A3")
    }
    
    @IBAction func saveStateA4(_ sender: UISwitch) {
        UserDefaults.standard.set(sender.isOn, forKey: "StateC2A4")
    }
    
    @IBAction func saveStateA5(_ sender: UISwitch) {
        UserDefaults.standard.set(sender.isOn, forKey: "StateC2A5")
    }
    
    @IBAction func saveStateB1(_ sender: UISwitch) {
        UserDefaults.standard.set(sender.isOn, forKey: "StateC2B1")
    }
    
    @IBAction func saveStateB2(_ sender: UISwitch) {
        UserDefaults.standard.set(sender.isOn, forKey: "StateC2B2")
    }
    
    @IBAction func saveStateB3(_ sender: UISwitch) {
        UserDefaults.standard.set(sender.isOn, forKey: "StateC2B3")
    }
    
    @IBAction func saveStateB4(_ sender: UISwitch) {
        UserDefaults.standard.set(sender.isOn, forKey: "StateC2B4")
    }
    
    @IBAction func saveStateC1(_ sender: UISwitch) {
        UserDefaults.standard.set(sender.isOn, forKey: "StateC2C1")
    }
    
    @IBAction func saveStateC2(_ sender: UISwitch) {
        UserDefaults.standard.set(sender.isOn, forKey: "StateC2C2")
    }
    
    @IBAction func saveStateC3(_ sender: UISwitch) {
        UserDefaults.standard.set(sender.isOn, forKey: "StateC2C3")
    }
    
    
    @IBAction func Recomendaciones(_ sender: UISwitch) {
        if (C2A1.isOn == true){
            arrayRecomendacionesC2[0] = ""
            updateRecomendaciones()
        }
        else{
            arrayRecomendacionesC2[0] = "- Como nos vemos predispone a nuestro prospecto a sentir afinidad por nosotros y lo que tenemos que decir. Recuerda ir vestido de acuerdo al contexto. \n\n"
            updateRecomendaciones()
        }
        if (C2A2.isOn == true){
            arrayRecomendacionesC2[1] = ""
            updateRecomendaciones()
        }
        else{
            arrayRecomendacionesC2[1] = "- Para asegurar una presentación efectiva, recuerda asegurarte de cuanto tiempo para presentar, y que no por una confusión de tiempo, pierdas la oportunidad de hacer una entrevista de impacto. \n\n"
            updateRecomendaciones()
        }
        if (C2A3.isOn == true && C2B2.isOn == true){
            arrayRecomendacionesC2[2] = ""
            updateRecomendaciones()
        }
        else{
            arrayRecomendacionesC2[2] = "- No dejes que un descuido te arruine una oportunidad de venta. Recuerda llevar todo lo que necesites, desde un Ipad, los adaptadores que puedas necesitar, llevar tu material de trabajo cargado etc. \n\n"
            updateRecomendaciones()
        }
        if (C2A4.isOn == true){
            arrayRecomendacionesC2[3] = ""
            updateRecomendaciones()
        }
        else{
            arrayRecomendacionesC2[3] = "- ¿Pudiste constatar que lo que investigaste es congruente con lo que viste cuando entraste al despacho? Recuerda que todo prospecto requiere tiempo, y ese tiempo depende tambien de la inversión, aunque no hay cliente pequeño. \n\n"
            updateRecomendaciones()
        }
        if (C2A5.isOn == true){
            arrayRecomendacionesC2[4] = ""
            updateRecomendaciones()
        }
        else{
            arrayRecomendacionesC2[4] = "- Descubre la modalidad en la que puedo hacerlo mi cliente (Renta de 12 o Full). \n\n"
            updateRecomendaciones()
        }
        if (C2B1.isOn == true){
            arrayRecomendacionesC2[5] = ""
            updateRecomendaciones()
        }
        else{
            arrayRecomendacionesC2[5] = "- No tener una buena tecnica rompe hielo, puede costarte la calidad de la presentación. Recuerda siempre decir algo agradable sobre el contexto en el que te encuentras. \n\n"
            updateRecomendaciones()
        }
        if (C2B3.isOn == true){
            arrayRecomendacionesC2[6] = ""
            updateRecomendaciones()
        }
        else{
            arrayRecomendacionesC2[6] = "- Presta atención al ambiente y entorno de la empresa y usalo para resaltar los aspectos positivos que identifiques. \n\n"
            updateRecomendaciones()
        }
        if (C2B4.isOn == true && C2C3.isOn == true){
            arrayRecomendacionesC2[7] = ""
            updateRecomendaciones()
        }
        else{
            arrayRecomendacionesC2[7] = "- Identifica algo positivo a mencionar sobre el cliente y usalo para establecer un vinculo con el cliente. \n\n"
            updateRecomendaciones()
        }
        if (C2C2.isOn == true){
            arrayRecomendacionesC2[8] = ""
            updateRecomendaciones()
        }
        else{
            arrayRecomendacionesC2[8] = "- Para vender, siempre es mas importante escuchar. \n\n"
            updateRecomendaciones()
        }
    }
    
    func updateRecomendaciones(){
        
        recomendaciones.text = arrayRecomendacionesC2[0] + arrayRecomendacionesC2[1] + arrayRecomendacionesC2[2] + arrayRecomendacionesC2[3] + arrayRecomendacionesC2[4] + arrayRecomendacionesC2[5] + arrayRecomendacionesC2[6] + arrayRecomendacionesC2[7] + arrayRecomendacionesC2[8]
    }
    
    
    //FUNCIONES PARA EL CALCULO
    @IBAction func updateValor(_ sender: UISwitch){
        if(C2A1.isOn == true){
            valoresBarChartC2[0] = 1
            updateCharts()
        }
        else{
            valoresBarChartC2[0] = 0
            updateCharts()
        }
        if(C2A2.isOn == true){
            valoresBarChartC2[1] = 2
            updateCharts()
        }
        else{
            valoresBarChartC2[1] = 0
            updateCharts()
        }
        if(C2A3.isOn == true){
            valoresBarChartC2[2] = 2
            updateCharts()
        }
        else{
            valoresBarChartC2[2] = 0
            updateCharts()
        }
        if(C2A4.isOn == true){
            valoresBarChartC2[3] = 2
            switchC2A4 = true
            updateCharts()
        }
        else{
            valoresBarChartC2[3] = -2
            switchC2A4 = false
            updateCharts()
        }
        if(C2A5.isOn == true){
            valoresBarChartC2[4] = 5
            updateCharts()
        }
        else{
            valoresBarChartC2[4] = 0
            updateCharts()
        }
        if(C2B1.isOn == true){
            valoresBarChartC2[5] = 5
            updateCharts()
        }
        else{
            valoresBarChartC2[5] = 0
            updateCharts()
        }
        if(C2B2.isOn == true){
            valoresBarChartC2[6] = 2
            updateCharts()
        }
        else{
            valoresBarChartC2[6] = 0
            updateCharts()
        }
        if(C2B3.isOn == true){
            valoresBarChartC2[7] = 1
            updateCharts()
        }
        else{
            valoresBarChartC2[7] = 0
            updateCharts()
        }
        if(C2B4.isOn == true){
            valoresBarChartC2[8] = 1
            updateCharts()
        }
        else{
            valoresBarChartC2[8] = 0
            updateCharts()
        }
        if(C2C1.isOn == true){
            valoresBarChartC2[9] = 2
            updateCharts()
        }
        else{
            valoresBarChartC2[9] = 0
            updateCharts()
        }
        if(C2C2.isOn == true){
            valoresBarChartC2[10] = 3
            updateCharts()
        }
        else{
            valoresBarChartC2[10] = -3
            updateCharts()
        }
        if(C2C3.isOn == true){
            valoresBarChartC2[11] = 3
            updateCharts()
        }
        else{
            valoresBarChartC2[11] = 0
            updateCharts()
        }
        
        //Para los cuadrantes en RadarChart
        let valorA = (valoresBarChartC2[0] + valoresBarChartC2[1] + valoresBarChartC2[2] + valoresBarChartC2[3] + valoresBarChartC2[4])
        let A = (((valorA + bonoC2[3]) / 12) * 100)
        
        if(A > 0){
            valoresRadarChartC2[0] = A
        }else{
            valoresRadarChartC2[0] = 0
        }
        
        let valorB = (valoresBarChartC2[5] + valoresBarChartC2[6] + valoresBarChartC2[7] + valoresBarChartC2[8])
        let B = (((valorB + bonoC2[5]) / 9) * 100)
        
        if(B > 0){
            valoresRadarChartC2[1] = B
        }else{
            valoresRadarChartC2[1] = 0
        }
        
        let valorC = (valoresBarChartC2[9] + valoresBarChartC2[10] + valoresBarChartC2[11])
        let C = (((valorC + bonoC2[11]) / 8) * 100)
        
        if(C > 0){
            valoresRadarChartC2[2] = C
        }else{
            valoresRadarChartC2[2] = 0
        }
        updateCharts()
        
        valorGeneralC2 = Int(((A + B + C) / 3))
        
    }
    
    func updateCharts(){
        setBarChart(dataPoints: nombresBarChart, values: valoresBarChartC2, values2: bonoC2, sortIndex: 0)
        setRadarChart(dataPoints: nombresRadarChart, values: valoresRadarChartC2)
    }
    
    //Funciones de los bonos
    @IBAction func bonos(){
        if (switchC1A1 == true && switchC1A2 == true && switchC1B2 == true && C2A4.isOn == true){
            bonoC2[3] = 2
        }else{
            bonoC2[3] = 0
        }
        if (switchC1A6 == true && switchC1B3 == true && switchC1B4 == true && C2A5.isOn == true && C2B1.isOn == true){
            bonoC2[5] = 2
        }else{
            bonoC2[5] = 0
        }
        if (C2A4.isOn == true && C2C3.isOn == true){
            bonoC2[11] = 1
        }else{
            bonoC2[11] = 0
        }
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
        radarChart.yAxis.axisMaximum = 130.0
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
