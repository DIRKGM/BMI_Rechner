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
      checkBMI(value: calculateBMI())
    }
 
    //MARK: BMI berechnen
    func calculateBMI () -> Double {
        let height = Double(sizeTextField.text!)!
        let weight = Double(weightTextField.text!)!
        
        let heightSquare = height * height
        let bmi = weight / heightSquare
        
        return bmi
    }
    
    func checkBMI (value: Double){
        var message = ""
        
        if value <= 20 {
            message = "Du hast Untergewicht. Dein BMI beträgt \(value)"
        } else if value >= 20 && value <= 25 {
            message = "Du hast Normalgewicht. Dein BMI beträgt \(value)"
        } else if value >= 25 && value <= 30 {
            message = "Du hast Übergewicht. Dein BMI beträgt \(value)"
        } else {
            message = "Du hast Übergewicht. Dein BMI beträgt \(value)"
        }
        erstelleAnzeige(message: message)
    }
    
    //MARK: -Erstelle Anzeige
    func erstelleAnzeige (message: String) {
        let alert = UIAlertController(title: "\(nameTextField.text!)", message: message, preferredStyle: .alert)
        let action1 = UIAlertAction(title: "Okay", style: .default) { (action) in  }
        alert.addAction(action1)
        self.present(alert, animated: true, completion: nil)
    }
    
    
    //MARK: -prüft ob es Veränderungen im Textfield gibt
    func addTargetToTextField(){
        nameTextField.addTarget(self, action: #selector(textFieldChanged), for: UIControl.Event.editingChanged)
        sizeTextField.addTarget(self, action: #selector(textFieldChanged), for: UIControl.Event.editingChanged)
        weightTextField.addTarget(self, action: #selector(textFieldChanged), for: UIControl.Event.editingChanged)
        
        nameTextField.addTarget(self, action: #selector(nameTextFieldChange), for: UIControl.Event.editingDidEnd)
        
        sizeTextField.addTarget(self, action: #selector(sizeTextFieldChange), for: UIControl.Event.editingDidEnd
        )
    }
    
    @objc func nameTextFieldChange (){
            let name = nameTextField.text!
            nameTextField.text = name.capitalizingFirstLetter()
        }
    
    @objc func sizeTextFieldChange (){
        let sizeAsString = sizeTextField.text!
        let characterset = CharacterSet(charactersIn: ".,")
        
        if sizeAsString.rangeOfCharacter(from: characterset) != nil {
            let sizeAsDouble = Double(sizeAsString)!
            sizeTextField.text = "\(Int(sizeAsDouble * 100.0))"
        } else if !(sizeTextField.text!.isEmpty) {
            let sizeAsCM = Double(sizeTextField.text!)!
            sizeTextField.text = "\(sizeAsCM / 100)"
        }
    }
    
    //MARK: -prüft ob Text vorhanden und macht Button klickbar
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
//MARK: -Erweiterung Strink um einige Funktionen erweitern
extension String {
    
    // Erster Buchstabe groß, Rest klein
    func capitalizingFirstLetter() -> String {
      return prefix(1).uppercased() + self.lowercased().dropFirst()
    }
 
    mutating func capitalizeFirstLetter() {
      self = self.capitalizingFirstLetter()
    }
}
