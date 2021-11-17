//
//  SearchStockViewController.swift
//  assignment7
//
//  Created by Deepansh Sachdeva on 11/10/21.
//

import UIKit

class SearchStockViewController: UIViewController {

    @IBOutlet weak var searchResultsTextArea: UITextView!
    @IBOutlet weak var searchKeywordField: UITextField!
    @IBOutlet weak var searchSelector: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func search(_ sender: UIButton) {
        
        let searchKeyword = searchKeywordField.text!
        
        guard searchKeyword != "" else {
            let alert = UIAlertController(title: "Error", message: "enter keyword to search", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        var searchStocks:[Stock] = []
        
        switch searchSelector.selectedSegmentIndex {
        case 0:
            let searchTerm = searchKeyword
            searchStocks += ds.stocks.filter({ $0.name.lowercased().contains(searchTerm.lowercased()) })
        case 1:
            let searchTerm = searchKeyword
            searchStocks += ds.stocks.filter({ $0.company.name.lowercased().contains(searchTerm.lowercased()) })
        case 2:
            let searchTerm = searchKeyword
            searchStocks += ds.stocks.filter({ $0.category.name.lowercased().contains(searchTerm.lowercased()) })
        case 3:
            let searchTerm = Int(searchKeyword)
            if searchTerm != nil {
                searchStocks += ds.stocks.filter({ $0.financialRating == searchTerm })
            } else {
                let alert = UIAlertController(title: "Error", message: "financial rating should be number from 1 to 10", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                
                self.present(alert, animated: true, completion: nil)
                
                return
            }
        case 4:
            let searchTerm = Double(searchKeyword)
            if searchTerm != nil {
                searchStocks += ds.stocks.filter({ $0.lastTradePrice == searchTerm })
            } else {
                let alert = UIAlertController(title: "Error", message: "last trade price should be decimal", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                
                self.present(alert, animated: true, completion: nil)
                
                return
            }
        default:
            searchResultsTextArea.text = "no stocks found according to search criteria"
        }
        
        if searchStocks.isEmpty {
            let alert = UIAlertController(title: "Message", message: "no results found", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            
            self.present(alert, animated: true, completion: nil)
            
            searchResultsTextArea.text = "no stocks found according to search criteria"
            
            return
        }
        
        searchResultsTextArea.text = searchStocks.map({"Id: \($0.id) Name: \($0.name)\nCategory: \($0.category) Company: \($0.company)\n Financial Rating: \($0.financialRating) Last Trade Price: $\($0.lastTradePrice)"}).joined(separator: "\n\n")
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
