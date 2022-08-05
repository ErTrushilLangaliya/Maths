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
            if (self.txtData.text!.last == ","){
                viewResult.isHidden = true
                Shared().showAlert(uIViewController: self, title: Shared().title, message: "Please enter valid data")
            }
            else{
                //Arrange array in a sequence
                var pointsArr = data.components(separatedBy: ",")
                pointsArr.sort {$0.localizedStandardCompare($1) == .orderedAscending}
                
                //Mean
                self.txtMean.text = "\(Shared().meanValue(pointsArr: pointsArr))"

                //Median
                self.txtMeadian.text = "\(Shared().medianValue(pointsArr: pointsArr))"
            }
            
        }else{
            viewResult.isHidden = true
            Shared().showAlert(uIViewController: self, title: Shared().title, message: "Please enter data")
        }
    }
}

