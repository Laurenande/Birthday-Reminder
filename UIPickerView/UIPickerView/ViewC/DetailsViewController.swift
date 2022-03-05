//
//  DetailsViewController.swift
//  UIPickerView
//
//  Created by Егор Куракин on 21.02.2022.
//

import UIKit

class DetailsViewController: UIViewController {
    
    weak var delegate: BirthDayViewControllerDelegate?
    
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var dateTF: UITextField!
    @IBOutlet weak var ageTF: UITextField!
    @IBOutlet weak var genderTF: UITextField!
    @IBOutlet weak var instagramTF: UITextField!
   
    let datePicker = UIDatePicker()
    var agePicker = UIPickerView()
    var genderPicker = UIPickerView()
    
    let gender = ["Мужской", "Женский"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //date picker
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.locale = .init(identifier: "Russian")
        
        //вызов методов для пикеров
        createDatePicker()
        createPicker()
        
        //присвоение пикеров текстфильдам
        ageTF.inputView = agePicker
        genderTF.inputView = genderPicker
        
        //вызов delegate and dateSource
        agePicker.dataSource = self
        agePicker.delegate = self
        genderPicker.dataSource = self
        genderPicker.delegate = self
        
        //индексы для свич
        agePicker.tag = 0
        genderPicker.tag = 1

    }
    //создание toolbar и кнопки done для пикера date
    func createDatePicker(){
        //создание toolbar
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        //создание bar button
        let doneButtton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(doneDateAction))
        toolbar.setItems([doneButtton], animated: true)
        
        //добавить toolbar
        dateTF.inputAccessoryView = toolbar
        //присвоение пикера текстфилду
        dateTF.inputView = datePicker
        //вид для date picker
        datePicker.datePickerMode = .date
    }
    //создание toolbar и кнопки done для пикеров
    func createPicker(){
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneButtton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(doneDateAction))
        toolbar.setItems([doneButtton], animated: true)
        
        //assing toolbar
        ageTF.inputAccessoryView = toolbar
        genderTF.inputAccessoryView = toolbar
    }
    
    @IBAction func instaAction(_ sender: Any) {
        let alertController = UIAlertController(title: "Введите свой Instagram", message: "", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default) {(action) in
            let TF = alertController.textFields?.first
            self.instagramTF.text! = (TF?.text)!
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addTextField(configurationHandler: nil)
        alertController.textFields![0].placeholder = "Пример name125"
        alertController.addAction(cancelAction)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
        
    }
    // метод для date picker
    @objc func doneDateAction(){
        //format
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .none
        formatter.locale = .init(identifier: "Russian")
        
        dateTF.text = formatter.string(from: datePicker.date)
        //remove datePicker or button done
        view.endEditing(true)
    }
    //remove Picker or button Done (age and gender picker)
    func doneAction(){
        view.endEditing(true)
    }
    //возврат на предыдущий VC по кнопке отмена
    @IBAction func cancelAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    //передача данных и возврат по кнопке Добавить
    @IBAction func addButton(_ sender: Any) {
        delegate?.update(name: nameTF.text!, age: ageTF.text!)
        dismiss(animated: true, completion: nil)
    }
}

extension DetailsViewController : UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag{
        case 0:
            return 100
        case 1:
            return gender.count
        default:
            return 1
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag{
        case 0:
            return String(row)
        case 1:
            return gender[row]
        default:
            return ""
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView.tag {
        case 0:
            ageTF.text = String(row)
        case 1:
            genderTF.text = gender[row]
        default:break
        }
    }
}
