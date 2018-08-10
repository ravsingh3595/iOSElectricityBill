//
//  ElectricityBillViewController.swift
//  ElectricityBill
//
//  Created by user on 2018-08-08.
//  Copyright © 2018 RavSingh. All rights reserved.
//

import UIKit

class ElectricityBillViewController: UIViewController {

    

    @IBOutlet weak var lblCustomerId: UITextField!
    @IBOutlet weak var lblCustomerName: UITextField!
    @IBOutlet weak var lblBillDate: UITextField!
    let datePicker = UIDatePicker()
    
    @IBOutlet weak var lblUnitConsumed: UITextField!

    @IBOutlet weak var genderSegmentController: UISegmentedControl!
    
    
    func showDatePicker(){
        //Formate Date
        datePicker.datePickerMode = .date
        
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
        showDatePicker()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func BtnBillDetails(_ sender: Any) {
        performSegue(withIdentifier: "ElectricityVc", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let newDetails = ElectricityBill(customerId: lblCustomerId.text ?? "", customerName: lblCustomerName.text ?? "", billDate: lblBillDate.text ?? "", unitConsumed: Double(lblUnitConsumed.text!) ?? 0, gender: genderSegmentControl(), total: 0)
        let destinationVC = segue.destination as! BillDetailsViewController
        destinationVC.detailsVar = newDetails
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
    
    
}

    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


