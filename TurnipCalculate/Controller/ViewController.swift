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

        purchasePrice.text = UserDefaults.standard.object(forKey: "sunday") as? String
        monAMTextField.text = UserDefaults.standard.object(forKey: "monAM") as? String
        monPMTextField.text = UserDefaults.standard.object(forKey: "monPM") as? String
        tueAMTextField.text = UserDefaults.standard.object(forKey: "tueAM") as? String
        tuePMTextField.text = UserDefaults.standard.object(forKey: "tuePM") as? String
        wenAMTextField.text = UserDefaults.standard.object(forKey: "wenAM") as? String
        wenPMTextField.text = UserDefaults.standard.object(forKey: "wenPM") as? String
        thuAMTextField.text = UserDefaults.standard.object(forKey: "thuAM") as? String
        thuPMTextField.text = UserDefaults.standard.object(forKey: "thuPM") as? String
        friAMTextField.text = UserDefaults.standard.object(forKey: "friAM") as? String
        friPMTextField.text = UserDefaults.standard.object(forKey: "friPM") as? String
        satAMTextField.text = UserDefaults.standard.object(forKey: "satAM") as? String
        satPMTextField.text = UserDefaults.standard.object(forKey: "satPM") as? String
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
    
    @IBAction func calculateButton(_ sender: UIButton) {
        
        UserDefaults.standard.set(purchasePrice.text, forKey: "sunday")
        UserDefaults.standard.set(monAMTextField.text, forKey: "monAM")
        UserDefaults.standard.set(monPMTextField.text, forKey: "monPM")
        UserDefaults.standard.set(tueAMTextField.text, forKey: "tueAM")
        UserDefaults.standard.set(tuePMTextField.text, forKey: "tuePM")
        UserDefaults.standard.set(wenAMTextField.text, forKey: "wenAM")
        UserDefaults.standard.set(wenPMTextField.text, forKey: "wenPM")
        UserDefaults.standard.set(thuAMTextField.text, forKey: "thuAM")
        UserDefaults.standard.set(thuPMTextField.text, forKey: "thuPM")
        UserDefaults.standard.set(friAMTextField.text, forKey: "friAM")
        UserDefaults.standard.set(friPMTextField.text, forKey: "friPM")
        UserDefaults.standard.set(satAMTextField.text, forKey: "satAM")
        UserDefaults.standard.set(satPMTextField.text, forKey: "satPM")
        
        
//    // MARK: - Navigation
//
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destination.
//        // Pass the selected object to the new view controller.
//
    }
    

}

