//
//  ManageOrderViewController.swift
//  assignment7
//
//  Created by Deepansh Sachdeva on 11/10/21.
//

import UIKit

class ManageOrderViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func createOrder(_ sender: UIButton) {
        guard !ds.stocks.isEmpty && !ds.customers.isEmpty else {
            let alert = UIAlertController(title: "Message", message: "no customers/stocks available", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        let vc = CreateOrderViewController(nibName: "CreateOrderViewController", bundle: nil)
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func viewOrders(_ sender: UIButton) {
        guard !ds.orders.isEmpty else {
            let alert = UIAlertController(title: "Message", message: "no orders available", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        let vc = ListOrderViewController(nibName: "ListOrderViewController", bundle: nil)
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func orderDetails(_ sender: UIButton) {
        guard !ds.orders.isEmpty else {
            let alert = UIAlertController(title: "Message", message: "no orders available", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        let vc = OrderDetailsViewController(nibName: "OrderDetailsViewController", bundle: nil)
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
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
