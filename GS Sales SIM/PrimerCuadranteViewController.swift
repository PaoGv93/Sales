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

    @IBOutlet weak var radarChart: RadarChartView!
    @IBOutlet weak var barChart: BarChartView!
    @IBOutlet weak var recomendaciones: UITextView!
    
    //recomendaciones
    var arrayRecomendaciones = ["", "", "", "", "", "", "", "", "", "", "", "", ""]
    
    var fraseFinal = String()


    //valores para grafica de radar
    let nombresRadarChart = ["C1", "C2", "C3"]
    let valoresRadarChart = [30.0, 50.0, 90.0]
    
    //valores para grafica de barras
    let nombresBarChart = ["p1", "p2", "p3", "p4", "p5", "p6", "p7", "p8", "p9", "p10", "p11", "p12"]
    let valoresBarChart = [3.0, 5.0, 9.0, 8.0, 5.0, 3.0, 6.0, 2.0, 5.0, 4.0, 1.0, 3.0]

    
    weak var axisFormatDelegate: IAxisValueFormatter?
    
    //Para recomendaciones repetidas
    @IBOutlet weak var C1A1: UISwitch!
    @IBOutlet weak var C1B3: UISwitch!
    
    
    
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
        if (C1B3.isOn == true && C1A1.isOn == true){
            arrayRecomendaciones[0] = ""
            updateRecomendaciones()
        }
        else{
            arrayRecomendaciones[0] = "Es importante para obtener información valiosa del prospecto, comprender mejor sus necesidades, quien es, que es importante para el, y como ofrecerle eso que esta necesitando. \n\n"
            updateRecomendaciones()
        }
    }
    
    @IBAction func estadoDos(_ sender: UISwitch) {
        if (sender.isOn == true){
            arrayRecomendaciones[1] = ""
            updateRecomendaciones()

        }
        else{
            arrayRecomendaciones[1] = "Es indispensable para hablar el mismo idioma en relación a las necesidades de su negocio. Conociendolo, es como aseguramos que el vea el valor de nuestro producto. \n\n"
            updateRecomendaciones()
        }
    }
    
    @IBAction func estadoTres(_ sender: UISwitch) {
        if (sender.isOn == true){
            arrayRecomendaciones[2] = ""
            updateRecomendaciones()

        }
        else{
            arrayRecomendaciones[2] = "Nos dan información no sólo sobre los aspectos profresionales del prospecto al que nos estamos acercando, nos ayudan a saber más sobre la persona, con el fin de entablar una comunicación más empatica. \n\n"
            updateRecomendaciones()
        }
    }
    
    @IBAction func estadoCuatro(_ sender: UISwitch) {
        if (sender.isOn == true){
            arrayRecomendaciones[3] = ""
            updateRecomendaciones()
        }
        else{
            arrayRecomendaciones[3] = "Nos habla de lo que al prospecto le hace negocio y como quiere llegar alla, nosotros debemos utilizar esta información con el fin de explicarle como a traves de las mejores practicas y el uso adecuado de la tecnología puede llegar a ese objetivo más rapido. \n\n"
            updateRecomendaciones()
        }
    }
    
    @IBAction func estadoCinco(_ sender: UISwitch) {
        if (sender.isOn == true){
            arrayRecomendaciones[4] = ""
            updateRecomendaciones()
        }
        else{
            arrayRecomendaciones[4] = "La implementeación de metodologías BIM debe de venir de altos mandos para que realmente se respete y exista un cambio de mentalidad interno. No podemos dejar de ver a las personas, cuando vendemos ARCHICAD / La cabeza de la orgranizaición es quien puede tomar la desicion de compra. \n\n"
            updateRecomendaciones()
        }
    }
    
    @IBAction func estadoSeis(_ sender: UISwitch) {
        if (sender.isOn == true){
            arrayRecomendaciones[5] = ""
            updateRecomendaciones()
        }
        else{
            arrayRecomendaciones[5] = "Observar que es lo que a lo largo del tiempo lo ha hecho exitoso, el tamaño del despacho al que nos acercamos, que es importante para ellos a la hora de crear nuevos proyectos. Y sobre todo, hacen sentir al prospecto comprendido, importante, y establecer un dialogo de confianza y empatía, basico para la venta de ARCHICAD. \n\n"
            updateRecomendaciones()
        }
    }
    
    @IBAction func estadoSiete(_ sender: UISwitch) {
        if (sender.isOn == true){
            arrayRecomendaciones[6] = ""
            updateRecomendaciones()
        }
        else{
            arrayRecomendaciones[6] = "Confirma los datos de contacto, es necesario saber que te estas acercando a las personas correctas. \n\n"
            updateRecomendaciones()
        }
    }
    
    @IBAction func estadoOcho(_ sender: UISwitch) {
        if (sender.isOn == true){
            arrayRecomendaciones[7] = ""
            updateRecomendaciones()
        }
        else{
            arrayRecomendaciones[7] = "Te permite un número aproximado de licencias que va a necesitar, y el tiempo de cierre de venta que puede llevar. \n\n"
            updateRecomendaciones()
        }
    }
    
    @IBAction func estadoNueve(_ sender: UISwitch) {
        if (sender.isOn == true){
            arrayRecomendaciones[8] = ""
            updateRecomendaciones()
        }
        else{
            arrayRecomendaciones[8] = "Esto te puede aportar nuevas oportunidades de venta. \n\n"
            updateRecomendaciones()
        }
    }
    
    @IBAction func estadoDiez(_ sender: UISwitch) {
        if (sender.isOn == true){
            arrayRecomendaciones[9] = ""
            updateRecomendaciones()
        }
        else{
            arrayRecomendaciones[9] = "Al realizar la llamada recuerda modular tu tono de voz, estar relajado, presentarte y mencionar el producto. \n\n"
            updateRecomendaciones()
        }
    }
    
    @IBAction func estadoOnce(_ sender: UISwitch) {
        if (sender.isOn == true){
            arrayRecomendaciones[10] = ""
            updateRecomendaciones()
        }
        else{
            arrayRecomendaciones[10] = "El primer argumento de valor para el cliente genera suficiente interes para que se cierre la cita. \n\n"
            updateRecomendaciones()
        }
    }
    
    @IBAction func estadoDoce(_ sender: UISwitch) {
        if (sender.isOn == true){
            arrayRecomendaciones[11] = ""
            updateRecomendaciones()
        }
        else{
            arrayRecomendaciones[11] = "Lo importante para vender ARCHICAD es llegar a la mesa con el cliente. \n\n"
            updateRecomendaciones()
        }
    }
    
    @IBAction func estadoTrece(_ sender: UISwitch) {
        if (sender.isOn == true){
            arrayRecomendaciones[12] = ""
            updateRecomendaciones()
        }
        else{
            arrayRecomendaciones[12] = "Es muy importante para despertar el interes, que nos ayude a llegar mejor a la cita. Envía un video con información no tecnica sobre lo que hace el programa y sus beneficios, o tambien podrías enviar la liga para que descarguen BIMx y un proyecto con el cual puedan empezar a jugar. \n\n"
            updateRecomendaciones()
        }
    }
    
    
    func updateRecomendaciones(){
        fraseFinal = arrayRecomendaciones[0] + arrayRecomendaciones[1] + arrayRecomendaciones[2] + arrayRecomendaciones[3] + arrayRecomendaciones[4] + arrayRecomendaciones[5] + arrayRecomendaciones[6] + arrayRecomendaciones[7] + arrayRecomendaciones[8] + arrayRecomendaciones[9] + arrayRecomendaciones[10] + arrayRecomendaciones[11] + arrayRecomendaciones[12]
        
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
