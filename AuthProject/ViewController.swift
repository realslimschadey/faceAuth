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

    @IBAction func changeView(_ sender: Any) {
        performSegue(withIdentifier: "segue1", sender: self)
    }
    
    @IBAction func touchID(_ sender: Any) {
    let context = LAContext()
        var error: NSError?
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error){
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "gimme face", reply: {(success, error) in
                if success{
                    self.performSegue(withIdentifier: "segue1", sender: self)
                }else {
                    if let error = error {
                        print(error)
                    }
                }
            })
        //FaceID popup
        } else {
            //No worky
            self.performSegue(withIdentifier: "segue2", sender: self)
            return
        }
    }
}

