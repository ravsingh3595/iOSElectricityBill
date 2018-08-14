//
//  BillDetailsViewController.swift
//  ElectricityBill
//
//  Created by user on 2018-08-08.
//  Copyright © 2018 RavSingh. All rights reserved.
//

import UIKit

class BillDetailsViewController: UIViewController {

    @IBOutlet weak var txtCustomerId: UITextField!
    @IBOutlet weak var txtCustomerName: UITextField!
    @IBOutlet weak var txtCustomerEmail: UITextField!
    @IBOutlet weak var txtBilldate: UITextField!
    @IBOutlet weak var txtUnitConsumed: UITextField!
    @IBOutlet weak var txtGender: UITextField!
    @IBOutlet weak var txtTotal: UITextField!
    
    var detailsVar: ElectricityBill?
    
    var delegate: PassDataProtocol?
    // Using delegate we can pass any value from (viewController) calling the function of protocol, and use that value in other view controlller by implementing the protocol and using the function of protocol.
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtCustomerId.text = detailsVar?.customerId
        txtCustomerName.text = detailsVar?.customerName
        txtCustomerEmail.text = detailsVar?.customerEmailId
        txtBilldate.text = detailsVar?.billDate
        txtGender.text = detailsVar?.gender.rawValue
        txtUnitConsumed.text = String(format:"%.2f", (detailsVar?.unitConsumed)!)
        txtTotal.text = String(format: "%.2f", (detailsVar?.calTotal())!)
        
        // Do any additional setup after loading the view.
        
        
         delegate?.setTotal(totalBill: (detailsVar?.calTotal())!)
//        let rightNextButton = UIBarButtonItem(title: "InputDetails", style: .plain, target: self, action: #selector(self.goToNext))
//        
//        self.navigationItem.leftBarButtonItem = rightNextButton
//        
//    }
//    
//    @objc func goToNext()
//    {
//        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//        
//        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "ElectricityBillVc") as! ElectricityBillViewController
//       
//        self.present(nextViewController, animated:true, completion:nil)
//        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
