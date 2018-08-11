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
    
    @IBOutlet weak var switchRemberMe: UISwitch!
    var userDefault: UserDefaults!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.userDefault = UserDefaults.standard
        if let userEmail = userDefault?.value(forKey: "UserName")
        {
            lblUserName.text = userEmail as? String
        }
        if let userPassword = userDefault?.value(forKey: "Password")
        {
            lblPassword.text = userPassword as? String
            //self.switchRemberMe.setOn(true, animated: true)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnLogin(_ sender: Any) {
        if lblUserName.text == "admin@a.com" && lblPassword.text == "secret"
        {
            if self.switchRemberMe.isOn
            {
                self.userDefault?.set(lblUserName.text, forKey: "UserName")
                self.userDefault?.set(lblPassword.text, forKey: "Password")
            }
            else{
                self.userDefault?.removeObject(forKey: "UserName")
                self.userDefault?.removeObject(forKey: "Password")
            }
            
            performSegue(withIdentifier: "LoginVc", sender: self)
        }
        else{
        }
    }
}
