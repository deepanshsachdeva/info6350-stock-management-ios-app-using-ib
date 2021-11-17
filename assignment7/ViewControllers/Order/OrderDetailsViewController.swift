//
//  OrderDetailsViewController.swift
//  assignment7
//
//  Created by Deepansh Sachdeva on 11/10/21.
//

import UIKit

class OrderDetailsViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var orderPicker: UIPickerView!
    
    @IBOutlet weak var orderDetailsTextArea: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        orderPicker.delegate = self
        orderPicker.dataSource = self
        
        fillDetailsFor(order: ds.orders[0])
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return ds.orders.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return ds.orders[row].description
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
    }
    
    func fillDetailsFor(order: Order) {
        orderDetailsTextArea.text = """
        Order ID : \(order.id)
        Date: \(order.date)
        Customer: \(order.customer)
        Stock: \(order.stock)
        Quantity: \(order.quantity)
        Buy Amount: $\(order.buyAmount)
        Sell Amount: $\(order.sellAmount ?? 0.0)
        Earnings: $\(order.getEarnings())
        """
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
