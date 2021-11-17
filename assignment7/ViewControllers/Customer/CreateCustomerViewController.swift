//
//  CreateCustomerViewController.swift
//  assignment7
//
//  Created by Deepansh Sachdeva on 11/10/21.
//

import UIKit

class CreateCustomerViewController: UIViewController {

    @IBOutlet weak var inputFirstName: UITextField!
    @IBOutlet weak var inputLastName: UITextField!
    @IBOutlet weak var inputAddress: UITextField!
    @IBOutlet weak var inputContact: UITextField!
    @IBOutlet weak var inputEmail: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func addCustomer(_ sender: UIButton) {
        let firstName = inputFirstName.text!
        let lastName = inputLastName.text!
        let address = inputAddress.text!
        let contact = inputContact.text!
        let email = inputEmail.text!
        
        guard firstName != "" else {
            let alert = UIAlertController(title: "Error", message: "first name is required", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        guard lastName != "" else {
            let alert = UIAlertController(title: "Error", message: "last name is required", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        guard address != "" else {
            let alert = UIAlertController(title: "Error", message: "address is required", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        guard contact != "" else {
            let alert = UIAlertController(title: "Error", message: "contact is required", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        guard contact.isValidPhoneNumber() else {
            let alert = UIAlertController(title: "Error", message: "contact is not valid", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        guard email != "" else {
            let alert = UIAlertController(title: "Error", message: "email is required", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        guard email.isValidEmail() else {
            let alert = UIAlertController(title: "Error", message: "email is not valid", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        ds.customers.append(Customer(firstName: firstName, lastName: lastName, address: address, contact: contact, email: email))
        
        let alert = UIAlertController(title: "Success", message: "'\(firstName+" "+lastName)' customer added", preferredStyle: UIAlertController.Style.alert)
        
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
