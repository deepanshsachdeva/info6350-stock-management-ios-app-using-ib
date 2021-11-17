//
//  ViewController.swift
//  assignment7
//
//  Created by Deepansh Sachdeva on 11/9/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

    @IBAction func manageCategories(_ sender: UIButton) {
        let vc = ManageCategoriesViewController(nibName: "ManageCategories", bundle: nil)
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func manageCompanies(_ sender: UIButton) {
        let vc = ManageCompanyViewController(nibName: "ManageCompanyViewController", bundle: nil)
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func manageStocks(_ sender: UIButton) {
        let vc = ManageStockViewController(nibName: "ManageStockViewController", bundle: nil)
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func manageCustomers(_ sender: UIButton) {
        let vc = ManageCustomerViewController(nibName: "ManageCustomerViewController", bundle: nil)
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func manageOrders(_ sender: UIButton) {
        let vc = ManageOrderViewController(nibName: "ManageOrderViewController", bundle: nil)
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
}

