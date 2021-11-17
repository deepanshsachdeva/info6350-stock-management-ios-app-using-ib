//
//  ListOrderViewController.swift
//  assignment7
//
//  Created by Deepansh Sachdeva on 11/10/21.
//

import UIKit

class ListOrderViewController: UIViewController,
UITableViewDelegate, UITableViewDataSource, UIPickerViewDelegate, UIPickerViewDataSource{

    @IBOutlet weak var customerPicker: UIPickerView!
    
    @IBOutlet weak var ordersList: UITableView!
    
    let cellReuseIdentifier = "cell"
    
    var selCustomer: Customer!
    
    var custOrders: [Order] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.ordersList.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        
        self.ordersList.tableFooterView = UIView()
        
        ordersList.delegate = self
        ordersList.dataSource = self
        
        customerPicker.delegate = self
        customerPicker.dataSource = self
        
        selCustomer = ds.customers[0]
        
        filterOrderForCustomer(selCustomer)
    }
    
    func filterOrderForCustomer(_ customer: Customer) {
        custOrders = ds.orders.filter({$0.customer.id == customer.id})
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return ds.customers.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return ds.customers[row].description
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selCustomer = ds.customers[row]
        
        filterOrderForCustomer(selCustomer)
        
        ordersList.reloadData()
        
        if custOrders.isEmpty {
            let alert = UIAlertController(title: "Message", message: "no orders available for the selected customer", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        custOrders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = ordersList.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath)
        
        cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellReuseIdentifier)
        
        cell.textLabel?.text = "ID: \(custOrders[indexPath.row].id)  \(custOrders[indexPath.row].stock) @ $\(custOrders[indexPath.row].stock.lastTradePrice)"
        cell.detailTextLabel?.text = "Quantity: \(custOrders[indexPath.row].quantity), Invested: $\(custOrders[indexPath.row].buyAmount), Date: \(custOrders[indexPath.row].date)"
                
        return cell
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .none
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .normal, title: "Sell", handler: {(action, view, completionHandler) in
            self.custOrders[indexPath.row].sell()
            completionHandler(true)
        })
        
        action.backgroundColor = .systemGreen
        
        return UISwipeActionsConfiguration(actions: [action])
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
