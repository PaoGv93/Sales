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

class ViewController: UIViewController {
    
    @IBOutlet weak var rfc: UITextField!
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
            resetDefaults()
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
            performSegue(withIdentifier: "primerCuadrante", sender: self)
        }
        else{
            let alert = UIAlertController(title: "Error", message: "Necesitas escribir tu RFC para avanzar", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Aceptar", style: .default, handler: nil))
            
            self.present(alert, animated: true)
        }

    }
    
}
