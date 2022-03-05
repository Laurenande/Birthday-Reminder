//
//  ViewController.swift
//  UIPickerView
//
//  Created by Егор Куракин on 07.02.2022.
//

import UIKit

class ViewController: UIViewController {

    //let picker = UIPickerView()
    //let picker = UIDatePicker()
    
    @IBOutlet weak var emalTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        /*
        picker.center = view.center
        //подписаться на протокол
        //picker.dataSource = self
        //picker.delegate = self
        picker.datePickerMode = .countDownTimer

        self.view.addSubview(picker)
        
        picker.addTarget(self, action: #selector(dataPickerChange(parameterPicker:)), for: .valueChanged)
         */
    }
    //скрыть клавиатуру по тапу
    @IBAction func tapKeyboardOff(_ sender: Any) {
        emalTF.resignFirstResponder()
        passwordTF.resignFirstResponder()
    }
    //глаз на пароль
    @IBAction func eyeButton(_ sender: Any) {
        passwordTF.isSecureTextEntry = !passwordTF.isSecureTextEntry
    }
    /*
    @objc func dataPickerChange(parameterPicker : UIDatePicker){
        if parameterPicker.isEqual(self.picker){
            print("data = \(parameterPicker.date)")
        }
    }*/
    

}

/*
extension UIViewController : UIPickerViewDataSource {
    //сколько вывести компонентов
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    //сколько вывести строк
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 10
    }
}
extension UIViewController : UIPickerViewDelegate {
    public func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let result = "row - \(row)"
        return result
    }
}
 */
