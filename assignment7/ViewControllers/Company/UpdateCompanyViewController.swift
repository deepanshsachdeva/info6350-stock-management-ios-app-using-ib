//
//  UpdateCompanyViewController.swift
//  assignment7
//
//  Created by Deepansh Sachdeva on 11/9/21.
//

import UIKit

class UpdateCompanyViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var companyPicker: UIPickerView!

    @IBOutlet weak var companyIdLabel: UILabel!
    @IBOutlet weak var inputName: UITextField!
    @IBOutlet weak var inputSymbol: UITextField!
    @IBOutlet weak var inputHeadquarter: UITextField!
    @IBOutlet weak var inputEmail: UITextField!
    
    var selCompany: Company?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        companyPicker.delegate = self
        companyPicker.dataSource = self
        
        setFieldValuesFor(ds.companies[0])
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // dispose any resources that can be recreated
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return ds.companies.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return ds.companies[row].description
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        setFieldValuesFor(ds.companies[row])
    }
    
    func setFieldValuesFor(_ company: Company) {
        selCompany = company
        
        companyIdLabel.text = "Company ID \(company.id)"
        
        inputName.text = company.name
        inputSymbol.text = company.symbol
        inputHeadquarter.text = company.headquarter
        inputEmail.text = company.email
    }
    

    @IBAction func updateCompany(_ sender: UIButton) {
        let name = inputName.text!
        let symbol = inputSymbol.text!
        let headquarter = inputHeadquarter.text!
        let email = inputEmail.text!
        
        guard name != "" else {
            let alert = UIAlertController(title: "Error", message: "name is required", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        guard symbol != "" else {
            let alert = UIAlertController(title: "Error", message: "symbol is required", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        guard headquarter != "" else {
            let alert = UIAlertController(title: "Error", message: "headquarter is required", preferredStyle: UIAlertController.Style.alert)
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
            let alert = UIAlertController(title: "Error", message: "email is invalid", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        selCompany?.name = name
        selCompany?.symbol = symbol
        selCompany?.headquarter = headquarter
        selCompany?.email = email
        
        let alert = UIAlertController(title: "Success", message: "\(name) company updated", preferredStyle: UIAlertController.Style.alert)
        
        let successAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default) {_ in
            self.dismiss(animated: true, completion: nil)
        }
        alert.addAction(successAction)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func goBack(_ sender: UIButton) {
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
