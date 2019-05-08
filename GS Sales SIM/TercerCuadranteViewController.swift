//
//  TercerCuadranteViewController.swift
//  GS Sales SIM
//
//  Created by Paola Garzón on 4/8/19.
//  Copyright © 2019 Paola Garzón. All rights reserved.
//

import UIKit
import Charts

var valorGeneralC3: Int = 100
var valoresRadarChartC3 = [0.0, 0.0, 0.0, 0.0, 0.0]
var valoresBarChartC3 = [0.0, -1.0, 0.0, -5.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, -2.0, 0.0, 0.0, 0.0, 0.0, 0.0, -2.0, 0.0, 0.0, 0.0]

var bonoC3 = [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0]

//valores para validar los bonos en otros viewControllers
var switchC3A2: Bool = true
var switchC3B3: Bool = true
var switchC3B5: Bool = true
var switchC3E1: Bool = true


class TercerCuadranteViewController: UIViewController {
    
    @IBOutlet weak var radarChart: RadarChartView!
    @IBOutlet weak var barChart: BarChartView!
    
    @IBOutlet weak var recomendaciones: UITextView!
    
    //Recomendaciones
    var arrayRecomendaciones = ["", "", "", "", "", "", "", "", "", "", "", "", "", ""]
    
    var fraseFinal = String()
    
    //nombres para las graficas
    let nombresRadarChart = ["A", "B", "C", "D", "E"]
    let nombresBarChart = ["A1", "A2", "A3", "B1", "B2", "B3", "B4", "B5", "C1", "D1", "D2", "D3", "D4", "E1", "E2", "E3", "E4", "E5", "E6", "E7"]
    
    weak var axisFormatDelegate: IAxisValueFormatter?
    
    @IBOutlet weak var C3A1: UISwitch!
    @IBOutlet weak var C3A2: UISwitch!
    @IBOutlet weak var C3A3: UISwitch!
    @IBOutlet weak var C3B1: UISwitch!
    @IBOutlet weak var C3B2: UISwitch!
    @IBOutlet weak var C3B3: UISwitch!
    @IBOutlet weak var C3B4: UISwitch!
    @IBOutlet weak var C3B5: UISwitch!
    
    @IBOutlet weak var C3C1Opt1: UIButton!
    @IBOutlet weak var C3C1Opt2: UIButton!
    @IBOutlet weak var C3C1Opt3: UIButton!
    @IBOutlet weak var C3C1Opt4: UIButton!
    
    @IBOutlet weak var C3D1: UISwitch!
    @IBOutlet weak var C3D2: UISwitch!
    @IBOutlet weak var C3D3: UISwitch!
    
    @IBOutlet weak var C3D4Opt1: UIButton!
    @IBOutlet weak var C3D4Opt2: UIButton!
    @IBOutlet weak var C3D4Opt3: UIButton!
    @IBOutlet weak var C3D4Opt4: UIButton!
    
    @IBOutlet weak var C3E1: UISwitch!
    @IBOutlet weak var C3E2: UISwitch!
    @IBOutlet weak var C3E3: UISwitch!
    @IBOutlet weak var C3E4: UISwitch!
    @IBOutlet weak var C3E5: UISwitch!
    @IBOutlet weak var C3E6: UISwitch!
    @IBOutlet weak var C3E7: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setRadarChart(dataPoints: nombresRadarChart, values: valoresRadarChartC3)
        let  xAxis : XAxis = self.radarChart.xAxis
        xAxis.labelFont = UIFont(name: "Arial-BoldMT", size: 16.0)!
        let  yAxis : YAxis = self.radarChart.yAxis
        yAxis.labelFont = UIFont(name: "Arial-BoldMT", size: 10.0)!
        
        axisFormatDelegate = self as? IAxisValueFormatter
        setBarChart(dataPoints: nombresBarChart, values: valoresBarChartC3, values2: bonoC3, sortIndex: 0)

        C3C1Opt1.tag = 1
        C3C1Opt2.tag = 2
        C3C1Opt3.tag = 3
        C3C1Opt4.tag = 4
        C3D4Opt1.tag = 1
        C3D4Opt2.tag = 2
        C3D4Opt3.tag = 3
        C3D4Opt4.tag = 4
        
        C3A1.isOn =  UserDefaults.standard.bool(forKey: "StateC3A1")
        C3A2.isOn =  UserDefaults.standard.bool(forKey: "StateC3A2")
        C3A3.isOn =  UserDefaults.standard.bool(forKey: "StateC3A3")
        C3B1.isOn =  UserDefaults.standard.bool(forKey: "StateC3B1")
        C3B2.isOn =  UserDefaults.standard.bool(forKey: "StateC3B2")
        C3B3.isOn =  UserDefaults.standard.bool(forKey: "StateC3B3")
        C3B4.isOn =  UserDefaults.standard.bool(forKey: "StateC3B4")
        C3B5.isOn =  UserDefaults.standard.bool(forKey: "StateC3B5")
        C3D1.isOn =  UserDefaults.standard.bool(forKey: "StateC3D1")
        C3D2.isOn =  UserDefaults.standard.bool(forKey: "StateC3D2")
        C3D3.isOn =  UserDefaults.standard.bool(forKey: "StateC3D3")
        C3E1.isOn =  UserDefaults.standard.bool(forKey: "StateC3E1")
        C3E2.isOn =  UserDefaults.standard.bool(forKey: "StateC3E2")
        C3E3.isOn =  UserDefaults.standard.bool(forKey: "StateC3E3")
        C3E4.isOn =  UserDefaults.standard.bool(forKey: "StateC3E4")
        C3E5.isOn =  UserDefaults.standard.bool(forKey: "StateC3E5")
        C3E6.isOn =  UserDefaults.standard.bool(forKey: "StateC3E6")
        C3E7.isOn =  UserDefaults.standard.bool(forKey: "StateC3E7")
    }
    
    @IBAction func saveStateA1(_ sender: UISwitch) {
        UserDefaults.standard.set(sender.isOn, forKey: "StateC3A1")
    }
    
    @IBAction func saveStateA2(_ sender: UISwitch) {
        UserDefaults.standard.set(sender.isOn, forKey: "StateC3A2")
    }
    
    @IBAction func saveStateA3(_ sender: UISwitch) {
        UserDefaults.standard.set(sender.isOn, forKey: "StateC3A3")
    }
    
    @IBAction func saveStateB1(_ sender: UISwitch) {
        UserDefaults.standard.set(sender.isOn, forKey: "StateC3B1")
    }
    
    @IBAction func saveStateB2(_ sender: UISwitch) {
        UserDefaults.standard.set(sender.isOn, forKey: "StateC3B2")
    }
    
    @IBAction func saveStateB3(_ sender: UISwitch) {
        UserDefaults.standard.set(sender.isOn, forKey: "StateC3B3")
    }
    
    @IBAction func saveStateB4(_ sender: UISwitch) {
        UserDefaults.standard.set(sender.isOn, forKey: "StateC3B4")
    }
    
    @IBAction func saveStateB5(_ sender: UISwitch) {
        UserDefaults.standard.set(sender.isOn, forKey: "StateC3B5")
    }
    
    @IBAction func saveStateD1(_ sender: UISwitch) {
        UserDefaults.standard.set(sender.isOn, forKey: "StateC3D1")
    }
    
    @IBAction func saveStateD2(_ sender: UISwitch) {
        UserDefaults.standard.set(sender.isOn, forKey: "StateC3D2")
    }
    
    @IBAction func saveStateD3(_ sender: UISwitch) {
        UserDefaults.standard.set(sender.isOn, forKey: "StateC3D3")
    }
    
    @IBAction func saveStateE1(_ sender: UISwitch) {
        UserDefaults.standard.set(sender.isOn, forKey: "StateC3E1")
    }
    
    @IBAction func saveStateE2(_ sender: UISwitch) {
        UserDefaults.standard.set(sender.isOn, forKey: "StateC3E2")
    }
    
    @IBAction func saveStateE3(_ sender: UISwitch) {
        UserDefaults.standard.set(sender.isOn, forKey: "StateC3E3")
    }
    
    @IBAction func saveStateE4(_ sender: UISwitch) {
        UserDefaults.standard.set(sender.isOn, forKey: "StateC3E4")
    }
    
    @IBAction func saveStateE5(_ sender: UISwitch) {
        UserDefaults.standard.set(sender.isOn, forKey: "StateC3E5")
    }
    
    @IBAction func saveStateE6(_ sender: UISwitch) {
        UserDefaults.standard.set(sender.isOn, forKey: "StateC3E6")
    }
    
    @IBAction func saveStateE7(_ sender: UISwitch) {
        UserDefaults.standard.set(sender.isOn, forKey: "StateC3E7")
    }
    
    @IBAction func Recomendaciones(_ sender: Any) {
        if (C3A1.isOn == true){
            arrayRecomendaciones[0] = ""
            updateRecomendaciones()
        }
        else{
            arrayRecomendaciones[0] = "- Recuerda que no es lo mismo hablar con la persona que tiene los conocimientos tecnicos que con la persona que tiene como prioridad las finanzas del despacho o empresa. \n\n"
            updateRecomendaciones()
        }

        if (C3A2.isOn == true){
            arrayRecomendaciones[1] = ""
            updateRecomendaciones()
        }
        else{
            arrayRecomendaciones[1] = "- La identificación de las necesidades correctas del prospecto es indispensables para tener el correcto angulo de venta. ¿Hiciste suficientes preguntas correctas? \n\n"
            updateRecomendaciones()
        }

        if (C3A3.isOn == true){
            arrayRecomendaciones[2] = ""
            updateRecomendaciones()
        }
        else{
            arrayRecomendaciones[2] = "- No se trata de sólo ir identificando las necesidades tecnicas, ve estructurando un plan de las herramientas que podrías mostrarle que resuelvan su necesidad a traves de un BIMx. \n\n"
            updateRecomendaciones()
        }

        if (C3B1.isOn == true){
            arrayRecomendaciones[3] = ""
            updateRecomendaciones()
        }
        else{
            arrayRecomendaciones[3] = "- Lo más importante para crear una relación de confianza y credibilidad, es que sepas con quien estas hablando y lo que para el es importante en su negocio. \n\n"
            updateRecomendaciones()
        }

        if (C3B2.isOn == true && C3B3.isOn == true){
            arrayRecomendaciones[4] = ""
            updateRecomendaciones()
        }
        else{
            arrayRecomendaciones[4] = "- Si identifico la cantidad de personas, se determina el mejor uso de ArchiCAD y beneficios. (Corroborar complejidad colaborativa, niveles de aprobación) \n\n"
            updateRecomendaciones()
        }

        if (C3B4.isOn == true){
            arrayRecomendaciones[5] = ""
            updateRecomendaciones()
        }
        else{
            arrayRecomendaciones[5] = "- Recuerda que toda implementación BIM exitosa viene desde \"arriba\". \n\n"
            updateRecomendaciones()
        }
 
        if (C3C1Opt1.isSelected == false && C3C1Opt2.isSelected == false && C3C1Opt3.isSelected == false && C3C1Opt4.isSelected == false && C3D1.isOn == true && C3D2.isOn == true && C3D3.isOn == true && C3D4Opt1.isSelected == false && C3D4Opt2.isSelected == false && C3D4Opt3.isSelected == false && C3D4Opt4.isSelected == false){
            arrayRecomendaciones[6] = ""
            updateRecomendaciones()
        }
        else{
            arrayRecomendaciones[6] = "- Entre mas preguntas hagas, mas información tendras para formular los argumentos correctos. \n\n"
            updateRecomendaciones()
        }

        if (C3E1.isOn == true){
            arrayRecomendaciones[7] = ""
            updateRecomendaciones()
        }
        else{
            arrayRecomendaciones[7] = "- Investiga y muestrale a tu cliente, como empresas similares que usan ArchiCAD, han logrado desarrollar proyectos exitosos. \n\n"
            updateRecomendaciones()
        }

        if (C3E2.isOn == true){
            arrayRecomendaciones[8] = ""
            updateRecomendaciones()
        }
        else{
            arrayRecomendaciones[8] = "- BIMx es la herramienta visual que nos ayuda a soportar de una forma didactica todos nuestros argumentos de venta. ¡No los desperdicies! \n\n"
            updateRecomendaciones()
        }

        if (C3E3.isOn == true){
            arrayRecomendaciones[9] = ""
            updateRecomendaciones()
        }
        else{
            arrayRecomendaciones[9] = "- Dar información sobre todo nuestro entorno de productos abre las posibilidades de crecer la cuenta. \n\n"
            updateRecomendaciones()
        }

        if (C3E4.isOn == true){
            arrayRecomendaciones[10] = ""
            updateRecomendaciones()
        }
        else{
            arrayRecomendaciones[10] = "- Abrir ArchiCAD sin hacer una demo, significa que probablemente no estes sentado con el tomado de desiciones. \n\n"
            updateRecomendaciones()
        }

        if (C3E5.isOn == true){
            arrayRecomendaciones[11] = ""
            updateRecomendaciones()
        }
        else{
            arrayRecomendaciones[11] = "- Mencionar nuestro servicio al cliente y servicios adicionales es uno de nuestros grandes distintivos como marca. \n\n"
            updateRecomendaciones()
        }

        if (C3E6.isOn == true){
            arrayRecomendaciones[12] = ""
            updateRecomendaciones()
        }
        else{
            arrayRecomendaciones[12] = "- Invitar al prospecto a que visite nuestras redes sociales, y que pueda ver nuestras campañas y videos, puede generar más interes. \n\n"
            updateRecomendaciones()
        }

        if (C3E7.isOn == true){
            arrayRecomendaciones[13] = ""
            updateRecomendaciones()
        }
        else{
            arrayRecomendaciones[13] = "- Solo si estas acompañado de alguien Técnico, es recomendable que se abra ArchiCAD y se demuestre su funcionamiento. \n\n"
            updateRecomendaciones()
        }
    }
    
    func updateRecomendaciones(){
        fraseFinal = arrayRecomendaciones[0] + arrayRecomendaciones[1] + arrayRecomendaciones[2] + arrayRecomendaciones[3] + arrayRecomendaciones[4] + arrayRecomendaciones[5] + arrayRecomendaciones[6] + arrayRecomendaciones[7] + arrayRecomendaciones[8] + arrayRecomendaciones[9] + arrayRecomendaciones[10] + arrayRecomendaciones[11] + arrayRecomendaciones[12] + arrayRecomendaciones[13]
        
        recomendaciones.text = fraseFinal
    }
    
    
    //FUNCIONES PARA EL CALCULO
    @IBAction func updateValor(_ sender: AnyObject){
        if(C3A1.isOn == true){
            valoresBarChartC3[0] = 2
            updateCharts()
        }
        else{
            valoresBarChartC3[0] = 0
            updateCharts()
        }
        if(C3A2.isOn == true){
            valoresBarChartC3[1] = 3
            switchC3A2 = true
            updateCharts()
        }
        else{
            valoresBarChartC3[1] = -1
            switchC3A2 = false
            updateCharts()
        }
        if(C3A3.isOn == true){
            valoresBarChartC3[2] = 2
            updateCharts()
        }
        else{
            valoresBarChartC3[2] = 0
            updateCharts()
        }
        if(C3B1.isOn == true){
            valoresBarChartC3[3] = 10
            updateCharts()
        }
        else{
            valoresBarChartC3[3] = -5
            updateCharts()
        }
        if(C3B2.isOn == true){
            valoresBarChartC3[4] = 1
            updateCharts()
        }
        else{
            valoresBarChartC3[4] = 0
            updateCharts()
        }
        if(C3B3.isOn == true){
            valoresBarChartC3[5] = 4
            switchC3B3 = true
            updateCharts()
        }
        else{
            valoresBarChartC3[5] = 0
            switchC3B3 = false
            updateCharts()
        }
        if(C3B4.isOn == true){
            valoresBarChartC3[6] = 2
            updateCharts()
        }
        else{
            valoresBarChartC3[6] = 0
            updateCharts()
        }
        if(C3B5.isOn == true){
            valoresBarChartC3[7] = 1
            switchC3B5 = true
            updateCharts()
        }
        else{
            valoresBarChartC3[7] = 0
            switchC3B5 = false
            updateCharts()
        }
        if(C3C1Opt1.isSelected == true){
            valoresBarChartC3[8] = -2
            updateCharts()
        }
        if(C3C1Opt2.isSelected == true){
            valoresBarChartC3[8] = 2
            updateCharts()
        }
        if(C3C1Opt3.isSelected == true){
            valoresBarChartC3[8] = 3
            updateCharts()
        }
        if(C3C1Opt4.isSelected == true){
            valoresBarChartC3[8] = 5
            updateCharts()
        }
        if(C3D1.isOn == true){
            valoresBarChartC3[9] = 1
            updateCharts()
        }
        else{
            valoresBarChartC3[9] = 0
            updateCharts()
        }
        if(C3D2.isOn == true){
            valoresBarChartC3[10] = 5
            updateCharts()
        }
        else{
            valoresBarChartC3[10] = -2
            updateCharts()
        }
        if(C3D3.isOn == true){
            valoresBarChartC3[11] = 3
            updateCharts()
        }
        else{
            valoresBarChartC3[11] = 0
            updateCharts()
        }
        if(C3D4Opt1.isSelected == true){
            valoresBarChartC3[12] = 1
            updateCharts()
        }
        if(C3D4Opt2.isSelected == true){
            valoresBarChartC3[12] = 2
            updateCharts()
        }
        if(C3D4Opt3.isSelected == true){
            valoresBarChartC3[12] = 4
            updateCharts()
        }
        if(C3D4Opt4.isSelected == true){
            valoresBarChartC3[12] = 5
            updateCharts()
        }
        if(C3E1.isOn == true){
            valoresBarChartC3[13] = 2
            switchC3E1 = true
            updateCharts()
        }
        else{
            valoresBarChartC3[13] = 0
            switchC3E1 = false
            updateCharts()
        }
        if(C3E2.isOn == true){
            valoresBarChartC3[14] = 3
            updateCharts()
        }
        else{
            valoresBarChartC3[14] = 0
            updateCharts()
        }
        if(C3E3.isOn == true){
            valoresBarChartC3[15] = 1
            updateCharts()
        }
        else{
            valoresBarChartC3[15] = -2
            updateCharts()
        }
        if(C3E4.isOn == true){
            valoresBarChartC3[16] = -2
            updateCharts()
        }
        else{
            valoresBarChartC3[16] = 0
            updateCharts()
        }
        if(C3E5.isOn == true){
            valoresBarChartC3[17] = 2
            updateCharts()
        }
        else{
            valoresBarChartC3[17] = 0
            updateCharts()
        }
        if(C3E6.isOn == true){
            valoresBarChartC3[18] = 1
            updateCharts()
        }
        else{
            valoresBarChartC3[18] = 0
            updateCharts()
        }
        if(C3E7.isOn == true){
            valoresBarChartC3[19] = 2
            updateCharts()
        }
        else{
            valoresBarChartC3[19] = 0
            updateCharts()
        }
        
        //Para los cuadrantes en RadarChart
        let valorA = (((valoresBarChartC3[0] + valoresBarChartC3[1] + valoresBarChartC3[2]) * 100) / 7)
        if(valorA > 0){
            valoresRadarChartC3[0] = valorA
        }else{
            valoresRadarChartC3[0] = 0
        }
        
        let valorB = (((valoresBarChartC3[3] + valoresBarChartC3[4] + valoresBarChartC3[5] + valoresBarChartC3[6] + valoresBarChartC3[7]) * 100) / 18)
        if(valorB > 0){
            valoresRadarChartC3[1] = valorB
        }else{
            valoresRadarChartC3[1] = 0
        }
        
        let valorC = (((valoresBarChartC3[8]) * 100) / 5)
        if(valorC > 0){
            valoresRadarChartC3[2] = valorC
        }else{
            valoresRadarChartC3[2] = 0
        }
        
        let valorD = (((valoresBarChartC3[9] + valoresBarChartC3[10] + valoresBarChartC3[11] + valoresBarChartC3[12]) * 100) / 16)
        if(valorD > 0){
            valoresRadarChartC3[3] = valorD
        }else{
            valoresRadarChartC3[3] = 0
        }
        
        let valorE = (((valoresBarChartC3[13] + valoresBarChartC3[14] + valoresBarChartC3[15] + valoresBarChartC3[16] + valoresBarChartC3[17] + valoresBarChartC3[18] + valoresBarChartC3[19]) * 100) / 9)
        if(valorE > 0){
            valoresRadarChartC3[4] = valorE
        }else{
            valoresRadarChartC3[4] = 0
        }
        updateCharts()
        
        valorGeneralC3 = Int(((valorA + valorB + valorC + valorD + valorE) / 5))

        
    }
    
    func updateCharts(){
        setRadarChart(dataPoints: nombresRadarChart, values: valoresRadarChartC3)
        setBarChart(dataPoints: nombresBarChart, values: valoresBarChartC3, values2: bonoC3, sortIndex: 0)
    }
    
    
    
    @IBAction func clickedC1(_ sender: Any) {
        switch (sender as AnyObject).tag {
        case 1:            C3C1Opt1.setImage(UIImage(named:"checkmark"), for: .normal)
        C3C1Opt2.setImage(UIImage(named:"checkmarkempty"), for: .normal)
        C3C1Opt3.setImage(UIImage(named:"checkmarkempty"), for: .normal)
        C3C1Opt4.setImage(UIImage(named:"checkmarkempty"), for: .normal)

        break;
        case 2:
            C3C1Opt1.setImage(UIImage(named:"checkmarkempty"), for: .normal)
            C3C1Opt2.setImage(UIImage(named:"checkmark"), for: .normal)
            C3C1Opt3.setImage(UIImage(named:"checkmarkempty"), for: .normal)
            C3C1Opt4.setImage(UIImage(named:"checkmarkempty"), for: .normal)
            break;
        case 3:
            C3C1Opt1.setImage(UIImage(named:"checkmarkempty"), for: .normal)
            C3C1Opt2.setImage(UIImage(named:"checkmarkempty"), for: .normal)
            C3C1Opt3.setImage(UIImage(named:"checkmark"), for: .normal)
            C3C1Opt4.setImage(UIImage(named:"checkmarkempty"), for: .normal)
            break;
        case 4:
            C3C1Opt1.setImage(UIImage(named:"checkmarkempty"), for: .normal)
            C3C1Opt2.setImage(UIImage(named:"checkmarkempty"), for: .normal)
            C3C1Opt3.setImage(UIImage(named:"checkmarkempty"), for: .normal)
            C3C1Opt4.setImage(UIImage(named:"checkmark"), for: .normal)
            break;
        default:
        C3C1Opt1.setImage(UIImage(named:"checkmarkempty"), for: .normal)
        C3C1Opt2.setImage(UIImage(named:"checkmarkempty"), for: .normal)
        C3C1Opt3.setImage(UIImage(named:"checkmarkempty"), for: .normal)
        C3C1Opt4.setImage(UIImage(named:"checkmarkempty"), for: .normal)
        break;
        }
    }
    
    @IBAction func clickedD4(_ sender: Any) {
        switch (sender as AnyObject).tag {
        case 1:            C3D4Opt1.setImage(UIImage(named:"checkmark"), for: .normal)
        C3D4Opt2.setImage(UIImage(named:"checkmarkempty"), for: .normal)
        C3D4Opt3.setImage(UIImage(named:"checkmarkempty"), for: .normal)
        C3D4Opt4.setImage(UIImage(named:"checkmarkempty"), for: .normal)
        
        break;
        case 2:
            C3D4Opt1.setImage(UIImage(named:"checkmarkempty"), for: .normal)
            C3D4Opt2.setImage(UIImage(named:"checkmark"), for: .normal)
            C3D4Opt3.setImage(UIImage(named:"checkmarkempty"), for: .normal)
            C3D4Opt4.setImage(UIImage(named:"checkmarkempty"), for: .normal)
            break;
        case 3:
            C3D4Opt1.setImage(UIImage(named:"checkmarkempty"), for: .normal)
            C3D4Opt2.setImage(UIImage(named:"checkmarkempty"), for: .normal)
            C3D4Opt3.setImage(UIImage(named:"checkmark"), for: .normal)
            C3D4Opt4.setImage(UIImage(named:"checkmarkempty"), for: .normal)
            break;
        case 4:
            C3D4Opt1.setImage(UIImage(named:"checkmarkempty"), for: .normal)
            C3D4Opt2.setImage(UIImage(named:"checkmarkempty"), for: .normal)
            C3D4Opt3.setImage(UIImage(named:"checkmarkempty"), for: .normal)
            C3D4Opt4.setImage(UIImage(named:"checkmark"), for: .normal)
            break;
        default:
            C3D4Opt1.setImage(UIImage(named:"checkmarkempty"), for: .normal)
            C3D4Opt2.setImage(UIImage(named:"checkmarkempty"), for: .normal)
            C3D4Opt3.setImage(UIImage(named:"checkmarkempty"), for: .normal)
            C3D4Opt4.setImage(UIImage(named:"checkmarkempty"), for: .normal)
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
    
    //Funciones de los bonos
    @IBAction func bonos(){
        if (C3A2.isOn == true && C3A3.isOn == true && C3B1.isOn == true){
            bonoC3[3] = 2
        }else{
            bonoC3[3] = 0
        }
        if(switchC1B2 == true && switchC2A4 == true && C3B2.isOn == true){
            bonoC3[4] = 1
        }else{
            bonoC3[4] = 0
        }
        if(switchC1A5 == true && C3B4.isOn == true){
            bonoC3[6] = 1
        }else{
            bonoC3[6] = 0
        }
        if(C3D1.isOn == true && C3D3.isOn == true){
            bonoC3[11] = 2
        }else{
            bonoC3[11] = 0
        }
        if(C3B1.isOn == true && C3E1.isOn == true){
            bonoC3[13] = 1
        }else{
            bonoC3[13] = 0
        }
        if(C3E1.isOn == true && C3E2.isOn == true){
            bonoC3[14] = 1
        }else{
            bonoC3[14] = 0
        }
        if(C3E2.isOn == true && C3E4.isOn == true){
            bonoC3[16] = 2
        }else{
            bonoC3[16] = 0
        }
        if(C3E1.isOn == true && C3E2.isOn == true && C3E3.isOn == true && C3E7.isOn == true){
            bonoC3[19] = 3
        }else{
            bonoC3[19] = 0
        }
    }
    
    
    //Funcion de la radarChart
    func setRadarChart(dataPoints: [String], values: [Double]) {
        
        let numAprobatorio = [0.0, 72.0, 30.0, 36.0, 44.0]
        
        //set de los numeros aprobatorios
        var dataEntriesA: [ChartDataEntry] = []
        for i in 0..<numAprobatorio.count {
            let dataEntryA = ChartDataEntry(x: Double(i), y: numAprobatorio[i])
            dataEntriesA.append(dataEntryA)
        }
        let chartDataSetA = RadarChartDataSet(values: dataEntriesA, label: "Número Aprobatorio")
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
        radarChart.legend.yOffset = 20
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
