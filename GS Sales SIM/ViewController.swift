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
