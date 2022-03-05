//
//  testViewController.swift
//  UIPickerView
//
//  Created by Егор Куракин on 21.02.2022.
//

import UIKit
protocol BirthDayViewControllerDelegate: AnyObject{
    func update(name: String, age: String)
}

class testViewController: UIViewController {

    func update(name: String, age: String) {
        
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
