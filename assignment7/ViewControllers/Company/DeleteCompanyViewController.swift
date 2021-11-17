//
//  DeleteCompanyViewController.swift
//  assignment7
//
//  Created by Deepansh Sachdeva on 11/9/21.
//

import UIKit

class DeleteCompanyViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var companyPicker: UIPickerView!
    
    var selRow: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        companyPicker.delegate = self
        companyPicker.dataSource = self
        
        selRow = 0
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
        selRow = row
    }

    @IBAction func deleteCompany(_ sender: UIButton) {
        ds.companies.remove(at: selRow!)
        
        let alert = UIAlertController(title: "Success", message: "company deleted", preferredStyle: UIAlertController.Style.alert)
        
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
