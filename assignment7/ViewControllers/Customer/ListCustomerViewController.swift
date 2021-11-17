//
//  ListCustomerViewController.swift
//  assignment7
//
//  Created by Deepansh Sachdeva on 11/10/21.
//

import UIKit

class ListCustomerViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var customerList: UITableView!
    
    let cellReuseIdentifier = "cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.customerList.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        
        self.customerList.tableFooterView = UIView()
        
        customerList.delegate = self
        customerList.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        ds.customers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = customerList.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath)
        
        cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellReuseIdentifier)
        
        cell.textLabel?.text = "ID: \(ds.customers[indexPath.row].id)  \(ds.customers[indexPath.row].description)"
        cell.detailTextLabel?.text = "Address: \(ds.customers[indexPath.row].address), Contact: \(ds.customers[indexPath.row].contact), Email: \(ds.customers[indexPath.row].email)"
                
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            ds.customers.remove(at: indexPath.row)
            customerList.deleteRows(at: [indexPath], with: .fade)
        }
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
