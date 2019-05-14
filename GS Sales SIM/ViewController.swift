//
//  ViewController.swift
//  GS Sales SIM
//
//  Created by Paola Garzón on 3/28/19.
//  Copyright © 2019 Paola Garzón. All rights reserved.
//

import UIKit
import AVKit

//Valor afuera de la clase para poder acceder a el valor en otro controller cuando cambio
var botonElegido: Int = 0
var textoRFC: String = ""

class ViewController: UIViewController {
    
    @IBOutlet weak var rfc: UITextField!
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
            resetDefaults()
            resetValores()
    }
    
    func resetDefaults() {
        let defaults = UserDefaults.standard
        let dictionary = defaults.dictionaryRepresentation()
        dictionary.keys.forEach { key in
            defaults.removeObject(forKey: "StateC1A1")
            defaults.removeObject(forKey: "StateC1A2")
            defaults.removeObject(forKey: "StateC1A3")
            defaults.removeObject(forKey: "StateC1A4")
            defaults.removeObject(forKey: "StateC1A5")
            defaults.removeObject(forKey: "StateC1A6")
            defaults.removeObject(forKey: "StateC1B1")
            defaults.removeObject(forKey: "StateC1B2")
            defaults.removeObject(forKey: "StateC1B3")
            defaults.removeObject(forKey: "StateC1B4")
            defaults.removeObject(forKey: "StateC1C1")
            defaults.removeObject(forKey: "StateC1C2")
            defaults.removeObject(forKey: "StateC1C3")
            defaults.removeObject(forKey: "StateC1C4")
            defaults.removeObject(forKey: "StateC1C5")
            defaults.removeObject(forKey: "StateC1C6")
            defaults.removeObject(forKey: "StateC1C7")
            defaults.removeObject(forKey: "StateC1C8")
            
            defaults.removeObject(forKey: "StateC2A1")
            defaults.removeObject(forKey: "StateC2A2")
            defaults.removeObject(forKey: "StateC2A3")
            defaults.removeObject(forKey: "StateC2A4")
            defaults.removeObject(forKey: "StateC2A5")
            defaults.removeObject(forKey: "StateC2B1")
            defaults.removeObject(forKey: "StateC2B2")
            defaults.removeObject(forKey: "StateC2B3")
            defaults.removeObject(forKey: "StateC2B4")
            defaults.removeObject(forKey: "StateC2C1")
            defaults.removeObject(forKey: "StateC2C2")
            defaults.removeObject(forKey: "StateC2C3")
            
            defaults.removeObject(forKey: "StateC3A1")
            defaults.removeObject(forKey: "StateC3A2")
            defaults.removeObject(forKey: "StateC3A3")
            defaults.removeObject(forKey: "StateC3B1")
            defaults.removeObject(forKey: "StateC3B2")
            defaults.removeObject(forKey: "StateC3B3")
            defaults.removeObject(forKey: "StateC3B4")
            defaults.removeObject(forKey: "StateC3B5")
            defaults.removeObject(forKey: "StateC3D1")
            defaults.removeObject(forKey: "StateC3D2")
            defaults.removeObject(forKey: "StateC3D3")
            defaults.removeObject(forKey: "StateC3E1")
            defaults.removeObject(forKey: "StateC3E2")
            defaults.removeObject(forKey: "StateC3E3")
            defaults.removeObject(forKey: "StateC3E4")
            defaults.removeObject(forKey: "StateC3E5")
            defaults.removeObject(forKey: "StateC3E6")
            defaults.removeObject(forKey: "StateC3E7")
            
            defaults.removeObject(forKey: "StateC4A1")
            defaults.removeObject(forKey: "StateC4A2")
            defaults.removeObject(forKey: "StateC4A3")
            defaults.removeObject(forKey: "StateC4A4")
            defaults.removeObject(forKey: "StateC4A5")
            defaults.removeObject(forKey: "StateC4A6")
            defaults.removeObject(forKey: "StateC4A7")
            defaults.removeObject(forKey: "StateC4A8")
            defaults.removeObject(forKey: "StateC4A9")
        }
    }

    //VALIDACION DE SELECCION DE NOMBRE
    @IBAction func Practica(_ sender: Any) {
        
        botonElegido = 1
        
        performSegue(withIdentifier: "primerCuadrante", sender: self)

    }
    
    @IBAction func Registro(_ sender: Any) {
        
        botonElegido = 2

        //valor para saber si selecciono una empresa o en caso contrario manda alerta
        if let text = rfc.text, !text.isEmpty {
            textoRFC = text
            performSegue(withIdentifier: "primerCuadrante", sender: self)
        }
        else{
            let alert = UIAlertController(title: "Error", message: "Necesitas escribir tu RFC para avanzar", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Aceptar", style: .default, handler: nil))
            
            self.present(alert, animated: true)
        }

    }
    
    //RESET DE TODAS LAS VIEWS
    func resetValores(){
        
        //PRIMER CUADRANTE
        valorGeneralC1 = 0
        valoresRadarChartC1 = [0.0, 0.0, 0.0]
        valoresBarChartC1 = [0.0, -2.0, 0.0, 0.0, 0.0, -2.0, 0.0, 0.0, 0.0, 0.0, -2.0, 0.0, 0.0, 0.0, 0.0, 0.0, -5.0, 0.0]
        bonoC1 = [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0]
        
        arrayRecomendacionesC1 = ["- Es importante para obtener información valiosa del prospecto, comprender mejor sus necesidades, quien es, que es importante para el, y como ofrecerle eso que esta necesitando. \n\n", "- Es indispensable para hablar el mismo idioma en relación a las necesidades de su negocio. Conociendolo, es como aseguramos que el vea el valor de nuestro producto. \n\n", "- Nos dan información no sólo sobre los aspectos profresionales del prospecto al que nos estamos acercando, nos ayudan a saber más sobre la persona, con el fin de entablar una comunicación más empatica. \n\n", "- Nos habla de lo que al prospecto le hace negocio y como quiere llegar alla, nosotros debemos utilizar esta información con el fin de explicarle como a traves de las mejores practicas y el uso adecuado de la tecnología puede llegar a ese objetivo más rapido. \n\n", "- La implementeación de metodologías BIM debe de venir de altos mandos para que realmente se respete y exista un cambio de mentalidad interno. No podemos dejar de ver a las personas, cuando vendemos ARCHICAD / La cabeza de la orgranizaición es quien puede tomar la desicion de compra. \n\n", "- Observar que es lo que a lo largo del tiempo lo ha hecho exitoso, el tamaño del despacho al que nos acercamos, que es importante para ellos a la hora de crear nuevos proyectos. Y sobre todo, hacen sentir al prospecto comprendido, importante, y establecer un dialogo de confianza y empatía, basico para la venta de ARCHICAD. \n\n", "- Confirma los datos de contacto, es necesario saber que te estas acercando a las personas correctas. \n\n", "- Te permite un número aproximado de licencias que va a necesitar, y el tiempo de cierre de venta que puede llevar. \n\n", "- Esto te puede aportar nuevas oportunidades de venta. \n\n", "- Al realizar la llamada recuerda modular tu tono de voz, estar relajado, presentarte y mencionar el producto. \n\n", "- El primer argumento de valor para el cliente genera suficiente interes para que se cierre la cita. \n\n", "- Lo importante para vender ARCHICAD es llegar a la mesa con el cliente. \n\n", "- Es muy importante para despertar el interes, que nos ayude a llegar mejor a la cita. Envía un video con información no tecnica sobre lo que hace el programa y sus beneficios, o tambien podrías enviar la liga para que descarguen BIMx y un proyecto con el cual puedan empezar a jugar. \n\n"]
        
        switchC1A1 = true
        switchC1A2 = true
        switchC1A5 = true
        switchC1A6 = true
        switchC1B2 = true
        switchC1B3 = true
        switchC1B4 = true
        
        
        //SEGUNDO CUADRANTE
        valorGeneralC2 = 0
        valoresRadarChartC2 = [0.0, 0.0, 0.0]
        valoresBarChartC2 = [0.0, 0.0, 0.0, -2.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, -3.0, 0.0]
        bonoC2 = [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0]
        
        arrayRecomendacionesC2 = ["- Como nos vemos predispone a nuestro prospecto a sentir afinidad por nosotros y lo que tenemos que decir. Recuerda ir vestido de acuerdo al contexto. \n\n", "- Para asegurar una presentación efectiva, recuerda asegurarte de cuanto tiempo para presentar, y que no por una confusión de tiempo, pierdas la oportunidad de hacer una entrevista de impacto. \n\n", "- No dejes que un descuido te arruine una oportunidad de venta. Recuerda llevar todo lo que necesites, desde un Ipad, los adaptadores que puedas necesitar, llevar tu material de trabajo cargado etc. \n\n", "- ¿Pudiste constatar que lo que investigaste es congruente con lo que viste cuando entraste al despacho? Recuerda que todo prospecto requiere tiempo, y ese tiempo depende tambien de la inversión, aunque no hay cliente pequeño. \n\n", "- Descubre la modalidad en la que puedo hacerlo mi cliente (Renta de 12 o Full). \n\n", "- No tener una buena tecnica rompe hielo, puede costarte la calidad de la presentación. Recuerda siempre decir algo agradable sobre el contexto en el que te encuentras. \n\n", "- Presta atención al ambiente y entorno de la empresa y usalo para resaltar los aspectos positivos que identifiques. \n\n", "- Identifica algo positivo a mencionar sobre el cliente y usalo para establecer un vinculo con el cliente. \n\n", "- Para vender, siempre es mas importante escuchar. \n\n"]
        
        switchC2A4 = true
        
        
        //TERCER CUADRANTE
        valorGeneralC3 = 0
        valoresRadarChartC3 = [0.0, 0.0, 0.0, 0.0, 0.0]
        valoresBarChartC3 = [0.0, -1.0, 0.0, -5.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, -2.0, 0.0, 0.0, 0.0, 0.0, 0.0, -2.0, 0.0, 0.0, 0.0]
        bonoC3 = [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0]
        
        arrayRecomendacionesC3 = ["- Recuerda que no es lo mismo hablar con la persona que tiene los conocimientos tecnicos que con la persona que tiene como prioridad las finanzas del despacho o empresa. \n\n", "- La identificación de las necesidades correctas del prospecto es indispensables para tener el correcto angulo de venta. ¿Hiciste suficientes preguntas correctas? \n\n", "- No se trata de sólo ir identificando las necesidades tecnicas, ve estructurando un plan de las herramientas que podrías mostrarle que resuelvan su necesidad a traves de un BIMx. \n\n", "- Lo más importante para crear una relación de confianza y credibilidad, es que sepas con quien estas hablando y lo que para el es importante en su negocio. \n\n", "- Si identifico la cantidad de personas, se determina el mejor uso de ArchiCAD y beneficios. (Corroborar complejidad colaborativa, niveles de aprobación) \n\n", "- Recuerda que toda implementación BIM exitosa viene desde \"arriba\". \n\n", "- Entre mas preguntas hagas, mas información tendras para formular los argumentos correctos. \n\n", "Dejar claras nuestras fortalezas frente a la competencia, nos deja en una posición de poder, sin siquiera tener que mencionar el nombre de otra marca.", "Tenemos estos dos planes de licenciamiento para brindar flexibilidad al negocio de nuestros clientes.", "El conocimiento de nuestras soluciones y la correcta exposición de ellas es básico para que quede claro como resolveremos el problema técnico o de negocio de nuestros clientes! Conoce tu producto.", "- Investiga y muestrale a tu cliente, como empresas similares que usan ArchiCAD, han logrado desarrollar proyectos exitosos. \n\n", "- BIMx es la herramienta visual que nos ayuda a soportar de una forma didactica todos nuestros argumentos de venta. ¡No los desperdicies! \n\n", "- Dar información sobre todo nuestro entorno de productos abre las posibilidades de crecer la cuenta. \n\n", "- Abrir ArchiCAD sin hacer una demo, significa que probablemente no estes sentado con el tomado de desiciones. \n\n", "- Mencionar nuestro servicio al cliente y servicios adicionales es uno de nuestros grandes distintivos como marca. \n\n", "- Invitar al prospecto a que visite nuestras redes sociales, y que pueda ver nuestras campañas y videos, puede generar más interes. \n\n", "- Solo si estas acompañado de alguien Técnico, es recomendable que se abra ArchiCAD y se demuestre su funcionamiento. \n\n"]
        
        switchC3A2 = true
        switchC3B3 = true
        switchC3B5 = true
        switchC3E1 = true
        
        
        //CUARTO CUADRANTE
        valorGeneralC4 = 0
        valoresBarChartC4 = [-2.0, 0.0, 0.0, -4.0, 0.0, 0.0, 0.0, 0.0, 0.0]
        bonoC4 = [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0]
        
        arrayRecomendacionesC4 = ["- Dejar pasar demasiado tiempo entre la visita y nuestro seguimiento, puede confundirse con desinteres o informalidad. No dejes pasar más de 24 horas en contactar a tu prospecto con información de valor. \n\n", "- Que tu correo tenga agradecimiento, compromisos, cotización, plan de adquisición, casos homologos, promociones vigentes y broshure de marca. No dejar claros los siguientes pasos de tu seguimiento puede hacerlo mas dificil de programar. Siempre deja claro cuando será tu proximo contacto y cumple. \n\n"]
    }
    
}
