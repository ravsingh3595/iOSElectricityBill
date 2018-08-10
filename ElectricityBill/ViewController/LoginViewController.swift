//
//  LoginViewController.swift
//  ElectricityBill
//
//  Created by user on 2018-08-08.
//  Copyright © 2018 RavSingh. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    
    @IBOutlet weak var lblUserName: UITextField!
    @IBOutlet weak var lblPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnLogin(_ sender: Any) {
        if lblUserName.text == "admin@a.com" && lblPassword.text == "secret"
        {
            performSegue(withIdentifier: "LoginVc", sender: self)
        }
        else{
        }
    }
}
