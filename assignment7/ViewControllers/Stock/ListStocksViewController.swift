//
//  ListStocksViewController.swift
//  assignment7
//
//  Created by Deepansh Sachdeva on 11/10/21.
//

import UIKit

class ListStocksViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var stockList: UITableView!
    
    let cellReuseIdentifier = "cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.stockList.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        
        self.stockList.tableFooterView = UIView()
        
        stockList.delegate = self
        stockList.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        ds.stocks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = stockList.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath)
        
        cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellReuseIdentifier)
        
        cell.textLabel?.text = "ID: \(ds.stocks[indexPath.row].id)  \(ds.stocks[indexPath.row].description) (Rating: \(ds.stocks[indexPath.row].financialRating))"
        cell.detailTextLabel?.text = "Company: \(ds.stocks[indexPath.row].company), Category: \(ds.stocks[indexPath.row].category), $\(ds.stocks[indexPath.row].lastTradePrice)"
                
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            ds.stocks.remove(at: indexPath.row)
            stockList.deleteRows(at: [indexPath], with: .fade)
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
