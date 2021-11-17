//
//  CreateOrderViewController.swift
//  assignment7
//
//  Created by Deepansh Sachdeva on 11/10/21.
//

import UIKit

class CreateOrderViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var customerPicker: UIPickerView!
    @IBOutlet weak var stockPicker: UIPickerView!
    
    @IBOutlet weak var inputQuantity: UITextField!
    @IBOutlet weak var priceLabel: UILabel!
    
    var selCustomer: Customer!
    var selStock: Stock!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        customerPicker.delegate = self
        customerPicker.dataSource = self
        
        stockPicker.delegate = self
        stockPicker.dataSource = self
        
        selCustomer = ds.customers[0]
        selStock = ds.stocks[0]
        
        priceLabel.text = "Last Trading Price: $\(selStock.lastTradePrice)"
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == customerPicker {
            return ds.customers.count
        }
        
        return ds.stocks.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == customerPicker {
            return ds.customers[row].description
        }
        
        return ds.stocks[row].description
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == customerPicker {
            selCustomer = ds.customers[row]
        } else {
            selStock = ds.stocks[row]
            
            priceLabel.text = "Last Trading Price: $\(selStock.lastTradePrice)"
        }
    }
    
    @IBAction func createOrder(_ sender: UIButton) {
        let quantity = Int(inputQuantity.text!)
        
        guard quantity != nil else {
            let alert = UIAlertController(title: "Error", message: "quantity is invalid", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        ds.orders.append(Order(customer: selCustomer, stock: selStock, quantity: quantity!))
        
        let alert = UIAlertController(title: "Success", message: "order created", preferredStyle: UIAlertController.Style.alert)
        
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
