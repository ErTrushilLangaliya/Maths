//
//  ViewController.swift
//  Statistics
//
//  Created by Trushil on 03/08/22.
//

import UIKit

class ViewController: UIViewController {
    
    //VARIABLES
    @IBOutlet weak var txtData: UITextField!
    @IBOutlet weak var btnReset: UIStackView!
    @IBOutlet weak var btnCalculate: UIStackView!
    @IBOutlet weak var viewResult: UIView!
    @IBOutlet weak var txtMean: UILabel!
    @IBOutlet weak var txtMeadian: UILabel!
    
    //Main
    override func viewDidLoad() {
        super.viewDidLoad()
        self.txtData.delegate = self
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        self.view.addGestureRecognizer(tap)
    }
    
    //on touch screen -dismiss keyboard
    @objc func dismissKeyboard() {
        self.view.endEditing(true)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        self.txtData.text="";
        viewResult.isHidden = true
    }
    
    
    //RESET BUTTON ACTION
    @IBAction func btnResetAction(_ sender: Any) {
        viewResult.isHidden = true
        self.txtData.text = ""
    }
    
    
    //CALCULATE BUTTON ACTION
    @IBAction func btnCalculateAction(_ sender: Any) {
        viewResult.isHidden = false
        
        let data = self.txtData.text!
        
        if (data.count != 0){
            if (self.txtData.text!.last != ","){
                //Arrange array in a sequence
                var pointsArr = data.components(separatedBy: ",")
                pointsArr.sort {$0.localizedStandardCompare($1) == .orderedAscending}
                
                //Mean
                let total = pointsArr.map { Int($0)! }   //Total Addition
                let Median = Double(total.sum())/Double(total.count)
                self.txtMean.text = "\((Median*100).rounded()/100)"     //2 decimal places
                
                //Meadian
                if (pointsArr.count % 2 == 0) {
                    print("even-length array (two middle elements)")
                    let firstValue = pointsArr[pointsArr.count/2]
                    let secoundValue = pointsArr[(pointsArr.count/2 - 1)]
                    self.txtMeadian.text = "\(secoundValue) & \(firstValue)"
                }else{
                    print("odd-length array (only one middle element)")
                    self.txtMeadian.text = "\(pointsArr[pointsArr.count/2])"
                }
            }
            else{
                viewResult.isHidden = true
                Shared().showAlert(uIViewController: self, title: Shared().title, message: "Please enter valid data")
            }
            
        }else{
            viewResult.isHidden = true
            Shared().showAlert(uIViewController: self, title: Shared().title, message: "Please enter data")
        }
    }
}


