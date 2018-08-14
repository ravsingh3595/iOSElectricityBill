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
        if let userEmail = userDefault?.value(forKey: "Email")
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
        
        // Email: abc@gmail.com
        // Password: QW@12ert
        
        if (lblUserName.text?.isValidEmail())! && (lblPassword.text?.isValidPassword())!
        {
            if self.switchRemberMe.isOn
            {
                self.userDefault?.set(lblUserName.text, forKey: "Email")
                self.userDefault?.set(lblPassword.text, forKey: "Password")
            }
            else{
                self.userDefault?.removeObject(forKey: "Email")
                self.userDefault?.removeObject(forKey: "Password")
            }
            
            performSegue(withIdentifier: "LoginVc", sender: self)
        }
        else{
            
             let myAlert = UIAlertController(title: "Validation Failed", message: "Incorrect Email ID", preferredStyle: .actionSheet)
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: {
                (alert: UIAlertAction)-> Void in
                
            })
            myAlert.addAction(cancelAction)
            self.present(myAlert, animated: true, completion: nil)
        }
    }
}

extension String {
    func isValidEmail() -> Bool {
        let regex = try! NSRegularExpression(pattern: "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$", options: .caseInsensitive)
        return regex.firstMatch(in: self, options: [], range: NSRange(location: 0, length: count)) != nil
    }
}


extension String {
    func isValidPassword() -> Bool {
        let regex = try! NSRegularExpression(pattern: "^(?=.*[A-Z].*[A-Z])(?=.*[!@#$&*])(?=.*[0-9].*[0-9])(?=.*[a-z].*[a-z].*[a-z]).{8}$", options: .caseInsensitive)
        return regex.firstMatch(in: self, options: [], range: NSRange(location: 0, length: count)) != nil
    }
}


/*
 Regex Explanation : -
 ^                         Start anchor
 (?=.*[A-Z].*[A-Z])        Ensure string has two uppercase letters.
 (?=.*[!@#$&*])            Ensure string has one special case letter.
 (?=.*[0-9].*[0-9])        Ensure string has two digits.
 (?=.*[a-z].*[a-z].*[a-z]) Ensure string has three lowercase letters.
 .{8}                      Ensure string is of length 8.
 $                         End anchor.
 */

//






