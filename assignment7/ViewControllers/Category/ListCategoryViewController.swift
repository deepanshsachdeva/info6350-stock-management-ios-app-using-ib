//
//  ListCategoryViewController.swift
//  assignment7
//
//  Created by Deepansh Sachdeva on 11/9/21.
//

import UIKit

class ListCategoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let cellReuseIdentifier = "cell"
    
    @IBOutlet weak var categoryList: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        categoryList.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        
        categoryList.tableFooterView = UIView()
        
        categoryList.delegate = self
        categoryList.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        ds.categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = categoryList.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath) as UITableViewCell
        
        cell.textLabel?.text = "ID: \(ds.categories[indexPath.row].id)  \(ds.categories[indexPath.row].description)"
                
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            ds.categories.remove(at: indexPath.row)
            categoryList.deleteRows(at: [indexPath], with: .fade)
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
