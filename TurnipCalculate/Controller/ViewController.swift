//
//  ViewController.swift
//  TurnipCalculate
//
//  Created by Kang on 2022/02/12.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var purchasePrice: UITextField! //매입가격
    
    @IBOutlet weak var monAMTextField: UITextField!
    @IBOutlet weak var monPMTextField: UITextField!
    
    @IBOutlet weak var tueAMTextField: UITextField!
    @IBOutlet weak var tuePMTextField: UITextField!
    
    @IBOutlet weak var wenAMTextField: UITextField!
    @IBOutlet weak var wenPMTextField: UITextField!
    
    @IBOutlet weak var thuAMTextField: UITextField!
    @IBOutlet weak var thuPMTextField: UITextField!
    
    @IBOutlet weak var friAMTextField: UITextField!
    @IBOutlet weak var friPMTextField: UITextField!
    
    @IBOutlet weak var satAMTextField: UITextField!
    @IBOutlet weak var satPMTextField: UITextField!

    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "무 값 입력"
        nextButton.isEnabled = false
    }
    
    @IBAction func initButton(_ sender: UIBarButtonItem) {
        purchasePrice.text = ""
        monAMTextField.text = ""
        monPMTextField.text = ""
        tueAMTextField.text = ""
        tuePMTextField.text = ""
        wenAMTextField.text = ""
        wenPMTextField.text = ""
        thuAMTextField.text = ""
        thuPMTextField.text = ""
        friAMTextField.text = ""
        friPMTextField.text = ""
        satAMTextField.text = ""
        satPMTextField.text = ""
    }
    
    @IBAction func textFieldValueChanged(_ sender: UITextField) {
        if purchasePrice.text != "" {
            nextButton.isEnabled = true
        } else {
            nextButton.isEnabled = false
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            self.purchasePrice.resignFirstResponder()
            self.monAMTextField.resignFirstResponder()
            self.monPMTextField.resignFirstResponder()
            self.tueAMTextField.resignFirstResponder()
            self.tuePMTextField.resignFirstResponder()
            self.wenAMTextField.resignFirstResponder()
            self.wenPMTextField.resignFirstResponder()
            self.thuAMTextField.resignFirstResponder()
            self.tuePMTextField.resignFirstResponder()
            self.friAMTextField.resignFirstResponder()
            self.friPMTextField.resignFirstResponder()
            self.satAMTextField.resignFirstResponder()
            self.satPMTextField.resignFirstResponder()
        
            
        }
    
    @IBAction func calculateButton(_ sender: UIButton) {
        TurnipInfomation.shared.sunPrice = purchasePrice.text
        TurnipInfomation.shared.monAM = monAMTextField.text
        TurnipInfomation.shared.monPM = monPMTextField.text
        TurnipInfomation.shared.tueAM = tueAMTextField.text
        TurnipInfomation.shared.tuePM = tuePMTextField.text
        TurnipInfomation.shared.wenAM = wenAMTextField.text
        TurnipInfomation.shared.wenPM = wenPMTextField.text
        TurnipInfomation.shared.thuAM = thuAMTextField.text
        TurnipInfomation.shared.thuPM = thuPMTextField.text
        TurnipInfomation.shared.friAM = friAMTextField.text
        TurnipInfomation.shared.friPM = friPMTextField.text
        TurnipInfomation.shared.satAM = satAMTextField.text
        TurnipInfomation.shared.satPM = satPMTextField.text
        
//    // MARK: - Navigation
//
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destination.
//        // Pass the selected object to the new view controller.
//
    }



}

