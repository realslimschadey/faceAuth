//
//  ViewController.swift
//  AuthProject
//
//  Created by Michael Schade on 3/13/18.
//  Copyright © 2018 Michael Schade. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    //MARK: Properties

    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var myLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    //MARK: Actions
    @IBAction func setDefaultLabelText(_ sender: UIButton) {
        myLabel.text = "Default Text"
    }
    
    
    //Added text
    
    
}

