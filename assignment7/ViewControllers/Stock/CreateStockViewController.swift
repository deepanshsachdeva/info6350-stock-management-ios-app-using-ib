//
//  CreateStockViewController.swift
//  assignment7
//
//  Created by Deepansh Sachdeva on 11/10/21.
//

import UIKit

class CreateStockViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var inputName: UITextField!
    @IBOutlet weak var inputLastTradePrice: UITextField!
    @IBOutlet weak var inputFinancialRating: UITextField!
    
    @IBOutlet weak var categoryPicker: UIPickerView!
    @IBOutlet weak var companyPicker: UIPickerView!
    
    var selCategory: Category?
    var selCompany: Company?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        categoryPicker.delegate = self
        categoryPicker.dataSource = self
        
        companyPicker.delegate = self
        companyPicker.dataSource = self
        
        selCategory = ds.categories[0]
        selCompany = ds.companies[0]
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == categoryPicker {
            return ds.categories.count
        }
        
        return ds.companies.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == categoryPicker {
            return ds.categories[row].description
        }
        
        return ds.companies[row].description
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == categoryPicker {
            selCategory = ds.categories[row]
        } else {
            selCompany = ds.companies[row]
        }
    }
    

    @IBAction func addStock(_ sender: UIButton) {
        let name = inputName.text!
        let lastTradePrice = Double(inputLastTradePrice.text!)
        let financialRating = Int(inputFinancialRating.text!)
        
        guard name != "" else {
            let alert = UIAlertController(title: "Error", message: "name is required", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        guard lastTradePrice != nil else {
            let alert = UIAlertController(title: "Error", message: "last trade price is invalid", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        guard financialRating != nil && financialRating! >= 1 && financialRating! <= 10 else {
            let alert = UIAlertController(title: "Error", message: "financial rating should be a number between 1-10", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        ds.stocks.append(Stock(name: name, company: selCompany!, lastTradePrice: lastTradePrice!, financialRating: financialRating!, category: selCategory!))
        
        let alert = UIAlertController(title: "Success", message: "'\(inputName.text!)' stock added", preferredStyle: UIAlertController.Style.alert)
        
        let successAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default) {_ in
            self.dismiss(animated: true, completion: nil)
        }
        alert.addAction(successAction)
        
        self.present(alert, animated: true, completion: nil)
    }

    
    
    @IBAction func goBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
