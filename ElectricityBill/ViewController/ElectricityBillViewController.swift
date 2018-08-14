//
//  ElectricityBillViewController.swift
//  ElectricityBill
//
//  Created by user on 2018-08-08.
//  Copyright © 2018 RavSingh. All rights reserved.
//

import UIKit

class ElectricityBillViewController: UIViewController, PassDataProtocol, UITextViewDelegate {

    @IBOutlet weak var lblCustomerEmail: UITextField!
    @IBOutlet weak var lblCustomerId: UITextField!
    @IBOutlet weak var lblCustomerName: UITextField!
    @IBOutlet weak var lblBillDate: UITextField!
    
    @IBOutlet weak var labelTotalAmount: UILabel!
    let datePicker = UIDatePicker()
    var userDefault: UserDefaults!
    
   
    
    @IBOutlet weak var lblUnitConsumed: UITextField!

    @IBOutlet weak var genderSegmentController: UISegmentedControl!
    
    
    func showDatePicker(){
        
        //Formate Date
        datePicker.datePickerMode = .date
        //labelTotalAmount.isHidden = true
        
        //ToolBar
        let toolbar = UIToolbar();
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(donedatePicker));
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelDatePicker));
        
        toolbar.setItems([doneButton,spaceButton,cancelButton], animated: false)
        
        lblBillDate.inputAccessoryView = toolbar
        lblBillDate.inputView = datePicker
        
    }
    @objc func donedatePicker(){
        
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        lblBillDate.text = formatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }
    
    @objc func cancelDatePicker(){
        self.view.endEditing(true)
    }


    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.userDefault = UserDefaults.standard
        lblCustomerEmail.text = userDefault?.value(forKey: "Email") as? String
        showDatePicker()
        
        lblUnitConsumed.delegate = self as? UITextFieldDelegate
        
        let rightNextButton = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(self.goToNext))
        
                self.navigationItem.leftBarButtonItem = rightNextButton
        
        // Do any additional setup after loading the view.
    }

    @objc func goToNext()
    {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "SplashVc") as! SplashViewController
        self.present(nextViewController, animated:true, completion:nil)
    }
    override func viewWillAppear(_ animated: Bool) {
        self.lblUnitConsumed.resignFirstResponder()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func BtnBillDetails(_ sender: Any) {
        performSegue(withIdentifier: "ElectricityVc", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if lblCustomerId.text?.count == 10 && lblCustomerId.text?.first == "C"
        {
        let details = ElectricityBill(customerEmailId: lblCustomerEmail.text ?? "", customerId: lblCustomerId.text ?? "", customerName: lblCustomerName.text ?? "", billDate: lblBillDate.text ?? "", unitConsumed: Double(lblUnitConsumed.text!) ?? 0, gender: genderSegmentControl(), total: 0)
            
        
        let destinationVC = segue.destination as! BillDetailsViewController
        destinationVC.delegate = self
        destinationVC.detailsVar = details
        self.lblUnitConsumed.resignFirstResponder()
        }
        else
        {
            
            let myAlert = UIAlertController(title: "Incorrect Customer ID", message: "Customer Id only start with C and must have 10 characters", preferredStyle: .actionSheet)
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: {
                (alert: UIAlertAction)-> Void in
                
            })
            myAlert.addAction(cancelAction)
            self.present(myAlert, animated: true, completion: nil)
        }
    }
    
    func genderSegmentControl() -> Gender {
        if genderSegmentController.selectedSegmentIndex == 0
        {
            return Gender.Male
        }
        else if genderSegmentController.selectedSegmentIndex == 1
        {
            return Gender.Female
        }
        return Gender.Male
    }
    
    func setTotal(totalBill: Double) {
        labelTotalAmount.text = "Total Bill Amount of previous bill = \(totalBill)"
    }
    
    
}
extension String{
    func isValidCustomerId() -> Bool {
        let regex = try! NSRegularExpression(pattern: "^(?=.*[C,c].*[A-Z])(?=.*[!@#$&*])(?=.*[0-9].*[0-9])(?=.*[a-z].*[a-z].*[a-z]).{10}$", options: .caseInsensitive)
        return regex.firstMatch(in: self, options: [], range: NSRange(location: 0, length: count)) != nil
    }
}
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


