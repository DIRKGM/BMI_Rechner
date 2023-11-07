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
      
    
    //MARK: -viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func clickHereButton_Tapped(_ sender: Any) {
    }
 
    func calculateBMI (){
        
    }
    
    // Funktion prüft ob es Veränderungen im Textfield gibt
    func addTargetToTextField(){
        nameTextField.addTarget(self, action: #selector(textFieldChanged), for: UIControl.Event.editingChanged)
        sizeTextField.addTarget(self, action: #selector(textFieldChanged), for: UIControl.Event.editingChanged)
        weightTextField.addTarget(self, action: #selector(textFieldChanged), for: UIControl.Event.editingChanged)
    }
    
    @objc func textFieldChanged(){
        
    }
}
 
