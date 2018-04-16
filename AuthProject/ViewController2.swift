//
//  ViewController2.swift
//  AuthProject
//
//  Created by Michael Schade on 4/16/18.
//  Copyright © 2018 Michael Schade. All rights reserved.
//

import UIKit
import GoogleSignIn

class ViewController2: UIViewController, GIDSignInUIDelegate{
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Google Sign In
        GIDSignIn.sharedInstance().uiDelegate = self
        

        let signInButton = GIDSignInButton()
        signInButton.center = view.center
        view.addSubview(signInButton)
        
  
        

        // Do any additional setup after loading the view.
    }
   

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didTapSignOut(_ sender: AnyObject){
        GIDSignIn.sharedInstance().signOut()
    }
    
    @IBAction func test1(_ sender: Any) {
        if (GIDSignIn.sharedInstance().hasAuthInKeychain()){
            self.performSegue(withIdentifier: "segueGood", sender: self)
        } else{
            return
        }
    }
    
    
    @IBAction func logout(_ sender: Any) {
        GIDSignIn.sharedInstance().signOut()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
