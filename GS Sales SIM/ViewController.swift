//
//  ViewController.swift
//  GS Sales SIM
//
//  Created by Paola Garzón on 3/28/19.
//  Copyright © 2019 Paola Garzón. All rights reserved.
//

import UIKit
import AVKit

class ViewController: UIViewController {
    
    @IBOutlet weak var rfc: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    //VALIDACION DE SELECCION DE NOMBRE
    @IBAction func Practica(_ sender: Any) {
        
        //valor para saber si selecciono una empresa o en caso contrario manda alerta
        if (rfc.text == "" || rfc.text == nil){
            performSegue(withIdentifier: "primerCuadrante", sender: self)
        }
        else{
            let alert = UIAlertController(title: "Error", message: "Necesitas seleccionar la empresa para avanzar", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Aceptar", style: .default, handler: nil))
            
            self.present(alert, animated: true)
        }

    }
    
    @IBAction func Registro(_ sender: Any) {
        //valor para saber si selecciono una empresa o en caso contrario manda alerta
        if (rfc.text == "" || rfc.text == nil){
            performSegue(withIdentifier: "primerCuadrante", sender: self)
        }
        else{
            let alert = UIAlertController(title: "Error", message: "Necesitas seleccionar la empresa para avanzar", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Aceptar", style: .default, handler: nil))
            
            self.present(alert, animated: true)
        }

    }
    
    
}

