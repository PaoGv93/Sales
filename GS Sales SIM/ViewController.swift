//
//  ViewController.swift
//  GS Sales SIM
//
//  Created by Paola Garzón on 3/28/19.
//  Copyright © 2019 Paola Garzón. All rights reserved.
//

import UIKit
import AVKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    let nombreEmpresa = ["Apple","Microsoft","Facebook","Ksquare"]

    @IBOutlet weak var labelNombre: UITextField!
    
    var pickerNombre = UIPickerView()
    var valorSeleccionado = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        pickerNombre.delegate = self
        pickerNombre.dataSource = self
        
        labelNombre.inputView = pickerNombre
    }
    
    //FUNCIONES DEL PICKER
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return nombreEmpresa.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return nombreEmpresa[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        valorSeleccionado = true
        labelNombre.text = nombreEmpresa[row]
        labelNombre.resignFirstResponder()
    }
    
    //VALIDACION DE SELECCION DE NOMBRE
    @IBAction func Practica(_ sender: Any) {
        
        //valor para saber si selecciono una empresa o en caso contrario manda alerta
        if (valorSeleccionado != false){
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
        if (valorSeleccionado != false){
            performSegue(withIdentifier: "primerCuadrante", sender: self)
        }
        else{
            let alert = UIAlertController(title: "Error", message: "Necesitas seleccionar la empresa para avanzar", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Aceptar", style: .default, handler: nil))
            
            self.present(alert, animated: true)
        }

    }
    
    
}

