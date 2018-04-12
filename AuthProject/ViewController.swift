//
//  ViewController.swift
//  AuthProject
//
//  Created by Michael Schade on 3/13/18.
//  Copyright © 2018 Michael Schade. All rights reserved.
//

import UIKit
import LocalAuthentication

class ViewController: UIViewController, UITextFieldDelegate{
    //MARK: Properties

    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var myLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        nameTextField.delegate = self
    }
    
    //MARK: Actions
    @IBAction func setDefaultLabelText(_ sender: UIButton) {
        myLabel.text = "Default Text"
    }
    
    
    //MARK: UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        myLabel.text = textField.text
    }

    @IBAction func touchID(_ sender: Any) {
        let context: LAContext = LAContext()
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil){
            context.evaluatePolicy(LAPolicy.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Face Pls", reply: {(wasCorrect, error) in
                if wasCorrect
                {
                    print("yooo")
                }
                else{
                    print("fuck")
                }
            })
        }
        else{
            //nothing worked
        }
    }
}

