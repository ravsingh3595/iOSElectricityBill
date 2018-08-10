//
//  SplashViewController.swift
//  ElectricityBill
//
//  Created by user on 2018-08-08.
//  Copyright © 2018 RavSingh. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {

    @IBOutlet weak var imgSplash: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        perform(#selector(self.showNavController), with: nil, afterDelay: 3)
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @objc func showNavController() {
        performSegue(withIdentifier: "SplashVc", sender: self)
    }
}
