//
//  UITextField.swift
//  Statistics
//
//  Created by Trushil on 03/08/22.
//

import Foundation
import UIKit

extension ViewController:UITextFieldDelegate{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if textField.keyboardType == .numbersAndPunctuation {
            guard CharacterSet(charactersIn: "0123456789,").isSuperset(of: CharacterSet(charactersIn: string)) else {
                Shared().showAlert(uIViewController: self, title: Shared().title, message: "This field accepts only numeric entries & Comma seperation.")
                return false
            }
            
            if textField.text!.contains(",,") {
                Shared().showAlert(uIViewController: self, title: Shared().title, message: "Please enter valid data")
            }
           
        }
        return true
    }
}
