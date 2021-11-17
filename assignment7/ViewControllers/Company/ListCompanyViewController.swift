//
//  ListCompanyViewController.swift
//  assignment7
//
//  Created by Deepansh Sachdeva on 11/9/21.
//

import UIKit

class ListCompanyViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let cellReuseIdentifier = "cell"

    @IBOutlet weak var companyList: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.companyList.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        
        self.companyList.tableFooterView = UIView()
        
        companyList.delegate = self
        companyList.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        ds.companies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = companyList.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath)
        
        cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellReuseIdentifier)
        
        cell.textLabel?.text = "ID: \(ds.companies[indexPath.row].id)  \(ds.companies[indexPath.row].description)"
        cell.detailTextLabel?.text = "Headquarter: \(ds.companies[indexPath.row].headquarter) Email: \(ds.companies[indexPath.row].email)"
                
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            ds.companies.remove(at: indexPath.row)
            companyList.deleteRows(at: [indexPath], with: .fade)
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
