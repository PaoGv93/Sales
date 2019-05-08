//
//  PrimerCuadranteViewController.swift
//  GS Sales SIM
//
//  Created by Paola Garzón on 4/8/19.
//  Copyright © 2019 Paola Garzón. All rights reserved.
//

import UIKit
import Charts

    var valorGeneralC1: Int = 100
    var valoresRadarChartC1 = [0.0, 0.0, 0.0]
    var valoresBarChartC1 = [0.0, -2.0, 0.0, 0.0, 0.0, -2.0, 0.0, 0.0, 0.0, 0.0, -2.0, 0.0, 0.0, 0.0, 0.0, 0.0, -5.0, 0.0]

    var bonoC1 = [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0]

    //valores para validar los bonos en otros viewControllers
    var switchC1A1: Bool = true
    var switchC1A2: Bool = true
    var switchC1A5: Bool = true
    var switchC1A6: Bool = true
    var switchC1B2: Bool = true
    var switchC1B3: Bool = true
    var switchC1B4: Bool = true


class PrimerCuadranteViewController: UIViewController {

    @IBOutlet weak var radarChart: RadarChartView!
    @IBOutlet weak var barChart: BarChartView!
    @IBOutlet weak var recomendaciones: UITextView!
    
    //nombres para las graficas
    let nombresRadarChart = ["A", "B", "C"]
    let nombresBarChart = ["A1", "A2", "A3", "A4", "A5", "A6", "B1", "B2", "B3", "B4", "C1", "C2", "C3", "C4", "C5", "C6", "C7", "C8"]
    
    //recomendaciones
    var arrayRecomendaciones = ["", "", "", "", "", "", "", "", "", "", "", "", ""]
    var fraseFinal = String()
    
    
    weak var axisFormatDelegate: IAxisValueFormatter?
    
    @IBOutlet weak var C1A1: UISwitch!
    @IBOutlet weak var C1A2: UISwitch!
    @IBOutlet weak var C1A3: UISwitch!
    @IBOutlet weak var C1A4: UISwitch!
    @IBOutlet weak var C1A5: UISwitch!
    @IBOutlet weak var C1A6: UISwitch!
    @IBOutlet weak var C1B1: UISwitch!
    @IBOutlet weak var C1B2: UISwitch!
    @IBOutlet weak var C1B3: UISwitch!
    @IBOutlet weak var C1B4: UISwitch!
    @IBOutlet weak var C1C1: UISwitch!
    @IBOutlet weak var C1C2: UISwitch!
    @IBOutlet weak var C1C3: UISwitch!
    @IBOutlet weak var C1C4: UISwitch!
    @IBOutlet weak var C1C5: UISwitch!
    @IBOutlet weak var C1C6: UISwitch!
    @IBOutlet weak var C1C7: UISwitch!
    @IBOutlet weak var C1C8: UISwitch!
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setRadarChart(dataPoints: nombresRadarChart, values: valoresRadarChartC1)
        let  xAxis : XAxis = self.radarChart.xAxis
        xAxis.labelFont = UIFont(name: "Arial-BoldMT", size: 16.0)!
        let  yAxis : YAxis = self.radarChart.yAxis
        yAxis.labelFont = UIFont(name: "Arial-BoldMT", size: 10.0)!
        
        axisFormatDelegate = self as? IAxisValueFormatter
        setBarChart(dataPoints: nombresBarChart, values: valoresBarChartC1, values2: bonoC1, sortIndex: 0)
        
        C1A1.isOn =  UserDefaults.standard.bool(forKey: "StateC1A1")
        C1A2.isOn =  UserDefaults.standard.bool(forKey: "StateC1A2")
        C1A3.isOn =  UserDefaults.standard.bool(forKey: "StateC1A3")
        C1A4.isOn =  UserDefaults.standard.bool(forKey: "StateC1A4")
        C1A5.isOn =  UserDefaults.standard.bool(forKey: "StateC1A5")
        C1A6.isOn =  UserDefaults.standard.bool(forKey: "StateC1A6")
        C1B1.isOn =  UserDefaults.standard.bool(forKey: "StateC1B1")
        C1B2.isOn =  UserDefaults.standard.bool(forKey: "StateC1B2")
        C1B3.isOn =  UserDefaults.standard.bool(forKey: "StateC1B3")
        C1B4.isOn =  UserDefaults.standard.bool(forKey: "StateC1B4")
        C1C1.isOn =  UserDefaults.standard.bool(forKey: "StateC1C1")
        C1C2.isOn =  UserDefaults.standard.bool(forKey: "StateC1C2")
        C1C3.isOn =  UserDefaults.standard.bool(forKey: "StateC1C3")
        C1C4.isOn =  UserDefaults.standard.bool(forKey: "StateC1C4")
        C1C5.isOn =  UserDefaults.standard.bool(forKey: "StateC1C5")
        C1C6.isOn =  UserDefaults.standard.bool(forKey: "StateC1C6")
        C1C7.isOn =  UserDefaults.standard.bool(forKey: "StateC1C7")
        C1C8.isOn =  UserDefaults.standard.bool(forKey: "StateC1C8")
        
    }
    
    @IBAction func saveStateA1(_ sender: UISwitch) {
        UserDefaults.standard.set(sender.isOn, forKey: "StateC1A1")
    }
    
    @IBAction func saveStateA2(_ sender: UISwitch) {
        UserDefaults.standard.set(sender.isOn, forKey: "StateC1A2")
    }
    
    @IBAction func saveStateA3(_ sender: UISwitch) {
        UserDefaults.standard.set(sender.isOn, forKey: "StateC1A3")
    }
    
    @IBAction func saveStateA4(_ sender: UISwitch) {
        UserDefaults.standard.set(sender.isOn, forKey: "StateC1A4")
    }
    
    @IBAction func saveStateA5(_ sender: UISwitch) {
        UserDefaults.standard.set(sender.isOn, forKey: "StateC1A5")
    }
    
    @IBAction func saveStateA6(_ sender: UISwitch) {
        UserDefaults.standard.set(sender.isOn, forKey: "StateC1A6")
    }
    
    @IBAction func saveStateB1(_ sender: UISwitch) {
        UserDefaults.standard.set(sender.isOn, forKey: "StateC1B1")
    }
    
    @IBAction func saveStateB2(_ sender: UISwitch) {
        UserDefaults.standard.set(sender.isOn, forKey: "StateC1B2")
    }
    
    @IBAction func saveStateB3(_ sender: UISwitch) {
        UserDefaults.standard.set(sender.isOn, forKey: "StateC1B3")
    }
    
    @IBAction func saveStateB4(_ sender: UISwitch) {
        UserDefaults.standard.set(sender.isOn, forKey: "StateC1B4")
    }
    
    @IBAction func saveStateC1(_ sender: UISwitch) {
        UserDefaults.standard.set(sender.isOn, forKey: "StateC1C1")
    }
    
    @IBAction func saveStateC2(_ sender: UISwitch) {
        UserDefaults.standard.set(sender.isOn, forKey: "StateC1C2")
    }
    
    @IBAction func saveStateC3(_ sender: UISwitch) {
        UserDefaults.standard.set(sender.isOn, forKey: "StateC1C3")
    }
    
    @IBAction func saveStateC4(_ sender: UISwitch) {
        UserDefaults.standard.set(sender.isOn, forKey: "StateC1C4")
    }
    
    @IBAction func saveStateC5(_ sender: UISwitch) {
        UserDefaults.standard.set(sender.isOn, forKey: "StateC1C5")
    }
    
    @IBAction func saveStateC6(_ sender: UISwitch) {
        UserDefaults.standard.set(sender.isOn, forKey: "StateC1C6")
    }
    
    @IBAction func saveStateC7(_ sender: UISwitch) {
        UserDefaults.standard.set(sender.isOn, forKey: "StateC1C7")
    }
    
    @IBAction func saveStateC8(_ sender: UISwitch) {
        UserDefaults.standard.set(sender.isOn, forKey: "StateC1C8")
    }

    
    @IBAction func Recomendaciones(_ sender: UISwitch) {
        if (C1B3.isOn == true && C1A1.isOn == true){
            arrayRecomendaciones[0] = ""
            updateRecomendaciones()
        }
        else{
            arrayRecomendaciones[0] = "- Es importante para obtener información valiosa del prospecto, comprender mejor sus necesidades, quien es, que es importante para el, y como ofrecerle eso que esta necesitando. \n\n"
            updateRecomendaciones()
        }
        
        if (C1A2.isOn == true){
            arrayRecomendaciones[1] = ""
            updateRecomendaciones()

        }
        else{
            arrayRecomendaciones[1] = "- Es indispensable para hablar el mismo idioma en relación a las necesidades de su negocio. Conociendolo, es como aseguramos que el vea el valor de nuestro producto. \n\n"
            updateRecomendaciones()
        }

        if (C1A3.isOn == true){
            arrayRecomendaciones[2] = ""
            updateRecomendaciones()

        }
        else{
            arrayRecomendaciones[2] = "- Nos dan información no sólo sobre los aspectos profresionales del prospecto al que nos estamos acercando, nos ayudan a saber más sobre la persona, con el fin de entablar una comunicación más empatica. \n\n"
            updateRecomendaciones()
        }

        if (C1A4.isOn == true){
            arrayRecomendaciones[3] = ""
            updateRecomendaciones()
        }
        else{
            arrayRecomendaciones[3] = "- Nos habla de lo que al prospecto le hace negocio y como quiere llegar alla, nosotros debemos utilizar esta información con el fin de explicarle como a traves de las mejores practicas y el uso adecuado de la tecnología puede llegar a ese objetivo más rapido. \n\n"
            updateRecomendaciones()
        }

        if (C1A5.isOn == true){
            arrayRecomendaciones[4] = ""
            updateRecomendaciones()
        }
        else{
            arrayRecomendaciones[4] = "- La implementeación de metodologías BIM debe de venir de altos mandos para que realmente se respete y exista un cambio de mentalidad interno. No podemos dejar de ver a las personas, cuando vendemos ARCHICAD / La cabeza de la orgranizaición es quien puede tomar la desicion de compra. \n\n"
            updateRecomendaciones()
        }

        if (C1A6.isOn == true){
            arrayRecomendaciones[5] = ""
            updateRecomendaciones()
        }
        else{
            arrayRecomendaciones[5] = "- Observar que es lo que a lo largo del tiempo lo ha hecho exitoso, el tamaño del despacho al que nos acercamos, que es importante para ellos a la hora de crear nuevos proyectos. Y sobre todo, hacen sentir al prospecto comprendido, importante, y establecer un dialogo de confianza y empatía, basico para la venta de ARCHICAD. \n\n"
            updateRecomendaciones()
        }

        if (C1B1.isOn == true){
            arrayRecomendaciones[6] = ""
            updateRecomendaciones()
        }
        else{
            arrayRecomendaciones[6] = "- Confirma los datos de contacto, es necesario saber que te estas acercando a las personas correctas. \n\n"
            updateRecomendaciones()
        }

        if (C1B2.isOn == true){
            arrayRecomendaciones[7] = ""
            updateRecomendaciones()
        }
        else{
            arrayRecomendaciones[7] = "- Te permite un número aproximado de licencias que va a necesitar, y el tiempo de cierre de venta que puede llevar. \n\n"
            updateRecomendaciones()
        }

        if (C1B4.isOn == true){
            arrayRecomendaciones[8] = ""
            updateRecomendaciones()
        }
        else{
            arrayRecomendaciones[8] = "- Esto te puede aportar nuevas oportunidades de venta. \n\n"
            updateRecomendaciones()
        }

        if (C1C1.isOn == true){
            arrayRecomendaciones[9] = ""
            updateRecomendaciones()
        }
        else{
            arrayRecomendaciones[9] = "- Al realizar la llamada recuerda modular tu tono de voz, estar relajado, presentarte y mencionar el producto. \n\n"
            updateRecomendaciones()
        }

        if (C1C3.isOn == true){
            arrayRecomendaciones[10] = ""
            updateRecomendaciones()
        }
        else{
            arrayRecomendaciones[10] = "- El primer argumento de valor para el cliente genera suficiente interes para que se cierre la cita. \n\n"
            updateRecomendaciones()
        }

        if (C1C7.isOn == true){
            arrayRecomendaciones[11] = ""
            updateRecomendaciones()
        }
        else{
            arrayRecomendaciones[11] = "- Lo importante para vender ARCHICAD es llegar a la mesa con el cliente. \n\n"
            updateRecomendaciones()
        }

        if (C1C8.isOn == true){
            arrayRecomendaciones[12] = ""
            updateRecomendaciones()
        }
        else{
            arrayRecomendaciones[12] = "- Es muy importante para despertar el interes, que nos ayude a llegar mejor a la cita. Envía un video con información no tecnica sobre lo que hace el programa y sus beneficios, o tambien podrías enviar la liga para que descarguen BIMx y un proyecto con el cual puedan empezar a jugar. \n\n"
            updateRecomendaciones()
        }
    }
    
    func updateRecomendaciones(){
        fraseFinal = arrayRecomendaciones[0] + arrayRecomendaciones[1] + arrayRecomendaciones[2] + arrayRecomendaciones[3] + arrayRecomendaciones[4] + arrayRecomendaciones[5] + arrayRecomendaciones[6] + arrayRecomendaciones[7] + arrayRecomendaciones[8] + arrayRecomendaciones[9] + arrayRecomendaciones[10] + arrayRecomendaciones[11] + arrayRecomendaciones[12]
        
        recomendaciones.text = fraseFinal
    }
    
    //FUNCIONES PARA EL CALCULO
    @IBAction func updateValor(_ sender: UISwitch){
        if(C1A1.isOn == true){
            valoresBarChartC1[0] = 2
            switchC1A1 = true
            updateCharts()
        }
        else{
            valoresBarChartC1[0] = 0
            switchC1A1 = false
            updateCharts()
        }
        if(C1A2.isOn == true){
            valoresBarChartC1[1] = 5
            switchC1A2 = true
            updateCharts()
        }
        else{
            valoresBarChartC1[1] = -2
            switchC1A2 = false
            updateCharts()
        }
        if(C1A3.isOn == true){
            valoresBarChartC1[2] = 2
            updateCharts()
        }
        else{
            valoresBarChartC1[2] = 0
            updateCharts()
        }
        if(C1A4.isOn == true){
            valoresBarChartC1[3] = 2
            updateCharts()
        }
        else{
            valoresBarChartC1[3] = 0
            updateCharts()
        }
        if(C1A5.isOn == true){
            valoresBarChartC1[4] = 3
            switchC1A5 = true
            updateCharts()
        }
        else{
            valoresBarChartC1[4] = 0
            switchC1A5 = false
            updateCharts()
        }
        if(C1A6.isOn == true){
            valoresBarChartC1[5] = 3
            switchC1A6 = true
            updateCharts()
        }
        else{
            valoresBarChartC1[5] = -2
            switchC1A6 = false
            updateCharts()
        }
        if(C1B1.isOn == true){
            valoresBarChartC1[6] = 1
            updateCharts()
        }
        else{
            valoresBarChartC1[6] = 0
            updateCharts()
        }
        if(C1B2.isOn == true){
            valoresBarChartC1[7] = 1
            switchC1B2 = true
            updateCharts()
        }
        else{
            valoresBarChartC1[7] = 0
            switchC1B2 = false
            updateCharts()
        }
        if(C1B3.isOn == true){
            valoresBarChartC1[8] = 1
            switchC1B3 = true
            updateCharts()
        }
        else{
            valoresBarChartC1[8] = 0
            switchC1B3 = false
            updateCharts()
        }
        if(C1B4.isOn == true){
            valoresBarChartC1[9] = 2
            switchC1B4 = true
            updateCharts()
        }
        else{
            valoresBarChartC1[9] = 0
            switchC1B4 = false
            updateCharts()
        }
        if(C1C1.isOn == true){
            valoresBarChartC1[10] = 2
            updateCharts()
        }
        else{
            valoresBarChartC1[10] = -2
            updateCharts()
        }
        if(C1C2.isOn == true){
            valoresBarChartC1[11] = 2
            updateCharts()
        }
        else{
            valoresBarChartC1[11] = 0
            updateCharts()
        }
        if(C1C3.isOn == true){
            valoresBarChartC1[12] = 5
            updateCharts()
        }
        else{
            valoresBarChartC1[12] = 0
            updateCharts()
        }
        if(C1C4.isOn == true){
            valoresBarChartC1[13] = 2
            updateCharts()
        }
        else{
            valoresBarChartC1[13] = 0
            updateCharts()
        }
        if(C1C5.isOn == true){
            valoresBarChartC1[14] = 2
            updateCharts()
        }
        else{
            valoresBarChartC1[14] = 0
            updateCharts()
        }
        if(C1C6.isOn == true){
            valoresBarChartC1[15] = 2
            updateCharts()
        }
        else{
            valoresBarChartC1[15] = 0
            updateCharts()
        }
        if(C1C7.isOn == true){
            valoresBarChartC1[16] = 10
            updateCharts()
        }
        else{
            valoresBarChartC1[16] = -5
            updateCharts()
        }
        if(C1C8.isOn == true){
            valoresBarChartC1[17] = 5
            updateCharts()
        }
        else{
            valoresBarChartC1[17] = 0
            updateCharts()
        }
        
        //Para los cuadrantes en RadarChart
        let valorA = (((valoresBarChartC1[0] + valoresBarChartC1[1] + valoresBarChartC1[2] + valoresBarChartC1[3] + valoresBarChartC1[4] + valoresBarChartC1[5]) * 100) / 17)
        if(valorA > 0){
            valoresRadarChartC1[0] = valorA
        }else{
            valoresRadarChartC1[0] = 0
        }
        
        let valorB = (((valoresBarChartC1[6] + valoresBarChartC1[7] + valoresBarChartC1[8] + valoresBarChartC1[9]) * 100) / 5)
        if(valorB > 0){
            valoresRadarChartC1[1] = valorB
        }else{
            valoresRadarChartC1[1] = 0
        }
        
        let valorC = (((valoresBarChartC1[10] + valoresBarChartC1[11] + valoresBarChartC1[12] + valoresBarChartC1[13] + valoresBarChartC1[14] + valoresBarChartC1[15] + valoresBarChartC1[16] + valoresBarChartC1[17]) * 100) / 30)
        if(valorC > 0){
            valoresRadarChartC1[2] = valorC
        }else{
            valoresRadarChartC1[2] = 0
        }
        updateCharts()
        
        valorGeneralC1 = Int(((valorA + valorB + valorC) / 3))
    }
    
    func updateCharts(){
        setBarChart(dataPoints: nombresBarChart, values: valoresBarChartC1, values2: bonoC1, sortIndex: 0)
        setRadarChart(dataPoints: nombresRadarChart, values: valoresRadarChartC1)
    }
    
    //Funciones de los bonos
    @IBAction func bonos(){
        if (C1A1.isOn == true && C1A3.isOn == true && C1A5.isOn == true && C1A6.isOn == true){
            bonoC1[5] = 1
        }else{
            bonoC1[5] = 0
        }
        if(C1C2.isOn == true && C1C3.isOn == true && C1C5.isOn == true && C1C7.isOn == true){
            bonoC1[16] = 2
        }else{
            bonoC1[16] = 0
        }
    }
    
    //Funcion de la radarChart
    func setRadarChart(dataPoints: [String], values: [Double]) {
        
        let numAprobatorio = [53.0, 60.0, 63.0]
        
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
        radarChart.chartDescription?.enabled = false
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
