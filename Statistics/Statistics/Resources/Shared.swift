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
    
    //Meadian
    func meanValue(pointsArr: [String]) -> String{
        let total = pointsArr.map { Int($0)! }   //Total Addition
        let Median = Double(total.sum())/Double(total.count)
        return "\((Median*100).rounded()/100)"
    }
   
    
    //Meadian
    func medianValue(pointsArr: [String]) -> String{
        if (pointsArr.count % 2 == 0) {
            print("even-length array (two middle elements)")
            let firstValue = pointsArr[pointsArr.count/2]
            let secoundValue = pointsArr[(pointsArr.count/2 - 1)]
            return "\(secoundValue) & \(firstValue)"
        }else{
            print("odd-length array (only one middle element)")
            return "\(pointsArr[pointsArr.count/2])"
        }
    }
}
