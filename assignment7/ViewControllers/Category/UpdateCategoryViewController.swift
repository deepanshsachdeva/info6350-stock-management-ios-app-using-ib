//
//  UpdateCategoryViewController.swift
//  assignment7
//
//  Created by Deepansh Sachdeva on 11/9/21.
//

import UIKit

class UpdateCategoryViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var categoryPicker: UIPickerView!
    
    @IBOutlet weak var categoryIdLabel: UILabel!
    @IBOutlet weak var inputName: UITextField!
    
    var selCategory: Category?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        categoryPicker.delegate = self
        categoryPicker.dataSource = self
        
        setFieldValuesFor(ds.categories[0])
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // dispose any resources that can be recreated
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return ds.categories.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return ds.categories[row].description
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        setFieldValuesFor(ds.categories[row])
    }

    @IBAction func updateCategory(_ sender: UIButton) {
        let name = inputName.text!
        
        guard name != "" else {
            let alert = UIAlertController(title: "Error", message: "name is required", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        selCategory?.name = name
        
        let alert = UIAlertController(title: "Success", message: "category updated", preferredStyle: UIAlertController.Style.alert)
        
        let successAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default) {_ in
            self.dismiss(animated: true, completion: nil)
        }
        alert.addAction(successAction)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func setFieldValuesFor(_ category: Category) {
        selCategory = category
        
        categoryIdLabel.text = "Category ID \(category.id)"
        
        inputName.text = category.name
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
