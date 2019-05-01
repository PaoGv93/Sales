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

    @IBOutlet weak var barChart: BarChartView!
    
    @IBOutlet weak var recomendaciones: UILabel!
    
    //recomendaciones
    var arrayRecomendaciones = ["", ""]
    
    var fraseFinal = String()
    
    //valores para grafica de barras
    let nombresBarChart = ["A1", "A2", "A3", "A4", "A5", "A6", "A7", "A8", "A9"]
    let valoresBarChart = [3.0, 5.0, 9.0, 8.0, 5.0, 3.0, 6.0, 2.0, 5.0]
    
    weak var axisFormatDelegate: IAxisValueFormatter?
    
    //Para las recomendaciones iguales
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
        setBarChart(dataPoints: nombresBarChart, values: valoresBarChart)
    }
    
    @IBAction func siguiente(_ sender: Any) {
        performSegue(withIdentifier: "finalRegistro", sender: self)


        /*if(valor == 1){
            performSegue(withIdentifier: "finalPractica", sender: self)

        }else if(valor == 2) {
            performSegue(withIdentifier: "finalRegistro", sender: self)

        }*/
    }
    
    @IBAction func estadoUno(_ sender: UISwitch) {
        if (sender.isOn == true){
            arrayRecomendaciones[0] = ""
            updateRecomendaciones()
        }
        else{
            arrayRecomendaciones[0] = "- Dejar pasar demasiado tiempo entre la visita y nuestro seguimiento, puede confundirse con desinteres o informalidad. No dejes pasar más de 24 horas en contactar a tu prospecto con información de valor. \n\n"
            updateRecomendaciones()
        }
    }
    
    @IBAction func estadoDos(_ sender: UISwitch) {
        if (C4A2.isOn == true && C4A3.isOn == true && C4A4.isOn == true && C4A5.isOn == true && C4A6.isOn == true && C4A7.isOn == true && C4A8.isOn == true && C4A9.isOn == true){
            arrayRecomendaciones[1] = ""
            updateRecomendaciones()
        }
        else{
            arrayRecomendaciones[1] = "- Que tu correo tenga agradecimiento, compromisos, cotización, plan de adquisición, casos homologos, promociones vigentes y broshure de marca. No dejar claros los siguientes pasos de tu seguimiento puede hacerlo mas dificil de programar. Siempre deja claro cuando será tu proximo contacto y cumple. \n\n"
            updateRecomendaciones()
        }
    }

    func updateRecomendaciones(){
        fraseFinal = arrayRecomendaciones[0] + arrayRecomendaciones[1]
        
        recomendaciones.text = fraseFinal
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
