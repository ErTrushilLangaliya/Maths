//
//  Shared.swift
//  Statistics
//
//  Created by Trushil on 03/08/22.
//

import Foundation
import UIKit

class Shared{
    let title : String = "Statstics"
    
    func showAlert(uIViewController:UIViewController, title : String, message :String){
        let uiAlert = UIAlertController(title: title, message: message , preferredStyle:.alert)
        uIViewController.present(uiAlert, animated: true, completion: nil)
        uiAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { action in }))
    }
}
