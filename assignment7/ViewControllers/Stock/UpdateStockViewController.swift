//
//  UpdateStockViewController.swift
//  assignment7
//
//  Created by Deepansh Sachdeva on 11/10/21.
//

import UIKit

class UpdateStockViewController: UIViewController,
UIPickerViewDelegate, UIPickerViewDataSource{

    @IBOutlet weak var stockPicker: UIPickerView!
    @IBOutlet weak var categoryPicker: UIPickerView!
    @IBOutlet weak var companyPicker: UIPickerView!

    @IBOutlet weak var inputName: UITextField!
    @IBOutlet weak var inputLastTradePrice: UITextField!
    @IBOutlet weak var inputFinancialRating: UITextField!
    
    var selStock: Stock!
    var selCategory: Category!
    var selCompany: Company!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        stockPicker.delegate = self
        stockPicker.dataSource = self
        
        categoryPicker.delegate = self
        categoryPicker.dataSource = self
        
        companyPicker.delegate = self
        companyPicker.dataSource = self
        
        setFieldsFor(ds.stocks[0])
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == categoryPicker {
            return ds.categories.count
        } else if pickerView == companyPicker {
            return ds.companies.count
        }
        
        return ds.stocks.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == categoryPicker {
            return ds.categories[row].description
        } else if pickerView == companyPicker {
            return ds.companies[row].description
        }
        
        return ds.stocks[row].description
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == stockPicker {
            selStock = ds.stocks[row]
        } else if pickerView == categoryPicker {
            selCategory = ds.categories[row]
        } else {
            selCompany = ds.companies[row]
        }
    }
    
    func setFieldsFor(_ stock: Stock){
        selStock = stock
        
        let ixCategory = ds.categories.firstIndex(where: {$0.id == selStock.category.id})
        categoryPicker.selectRow(ixCategory!, inComponent: 0, animated: true)
        selCategory = ds.categories[ixCategory!]
        
        let ixCompany = ds.companies.firstIndex(where: {$0.id == selStock.company.id})
        companyPicker.selectRow(ixCompany!, inComponent: 0, animated: true)
        selCompany = ds.companies[ixCategory!]
        
        inputName.text = selStock.name
        inputFinancialRating.text = String(selStock.financialRating)
        inputLastTradePrice.text = String(selStock.lastTradePrice)
    }

    @IBAction func updateStock(_ sender: UIButton) {
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
        
        selStock.name = name
        selStock.category = selCategory
        selStock.company = selCompany
        selStock.lastTradePrice = lastTradePrice!
        selStock.financialRating = financialRating!
        
        let alert = UIAlertController(title: "Success", message: "stock updated", preferredStyle: UIAlertController.Style.alert)
        
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
