//
//  BirthdayViewController.swift
//  UIPickerView
//
//  Created by Егор Куракин on 21.02.2022.
//

import UIKit
protocol BirthDayViewControllerDelegate: AnyObject{
    func update(name: String, age: String)
}

class BirthdayViewController: UIViewController, BirthDayViewControllerDelegate {
    @IBOutlet weak var nameLB: UILabel!
    
    @IBOutlet weak var ageLB: UILabel!
    func update(name: String, age: String) {
        nameLB.text? = name.capitalized
        ageLB.text = age + "years"
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? DetailsViewController else {return}
        destination.delegate = self
    }

}
