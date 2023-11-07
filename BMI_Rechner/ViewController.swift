//
//  ViewController.swift
//  BMI_Rechner
//
//  Created by Dirk Meyer on 07.11.23.
//

import UIKit

class ViewController: UIViewController {

    //MARK: -Outlets
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var sizeTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var clickHereButton: UIButton!
    
    //MARK: -viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        // beimn Start wird der Button deaktiviert
        clickHereButton.backgroundColor = UIColor(white: 0.8, alpha: 0.2)
        clickHereButton.isEnabled = false
        
        addTargetToTextField()
    }

    @IBAction func clickHereButton_Tapped(_ sender: Any) {
        calculateBMI()
    }
 
    func calculateBMI (){
        let height = Double(sizeTextField.text!)!
        let weight = Double(weightTextField.text!)!
        
        let heightSquare = height * height
        let bmi = weight / heightSquare
    }
    
    // Funktion prüft ob es Veränderungen im Textfield gibt
    func addTargetToTextField(){
        nameTextField.addTarget(self, action: #selector(textFieldChanged), for: UIControl.Event.editingChanged)
        sizeTextField.addTarget(self, action: #selector(textFieldChanged), for: UIControl.Event.editingChanged)
        weightTextField.addTarget(self, action: #selector(textFieldChanged), for: UIControl.Event.editingChanged)
    }
    // prüft ob Text vorhanden und macht Button klickbar
    @objc func textFieldChanged(){
        if !(nameTextField.text!.isEmpty) && !(sizeTextField.text!.isEmpty) && !(weightTextField.text!.isEmpty) {
            clickHereButton.backgroundColor = UIColor (white: 1.0, alpha: 0.8)
            clickHereButton.isEnabled = true
            
        } else {
            //kein Text vorhanden
            clickHereButton.backgroundColor = UIColor(white: 0.8, alpha: 0.2)
            clickHereButton.isEnabled = false
            
        }
    }
}
 
