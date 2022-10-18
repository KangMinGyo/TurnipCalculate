//
//  ViewController.swift
//  TurnipCalculate
//
//  Created by Kang on 2022/02/12.
//

import UIKit
import GoogleMobileAds
import AppTrackingTransparency

class ViewController: UIViewController {
    
    lazy var initButton: UIBarButtonItem = {
        let button = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(buttonPressend))
        button.tintColor = .black
        return button
    }()
    
    lazy var sunView: UIView = {
       let view = UIView()
        view.backgroundColor = .systemBackground
        view.layer.cornerRadius = 15
        return view
    }()
    
    lazy var sunLabel: UILabel = {
       let label = UILabel()
        label.text = "일요일"
        return label
    }()
    
    lazy var sunTextField: UITextField = {
       let textField = UITextField()
        textField.layer.cornerRadius = 10
        textField.backgroundColor = .systemGray6
        textField.textAlignment = .center
        return textField
    }()
    
    lazy var restView: UIView = {
       let view = UIView()
        view.backgroundColor = .systemBackground
        view.layer.cornerRadius = 15
        return view
    }()
    
    var weekStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 60
        return stackView
    }()
    
    lazy var monLabel: UILabel = {
       let label = UILabel()
        label.text = "월요일"
        return label
    }()
    
    lazy var tueLabel: UILabel = {
       let label = UILabel()
        label.text = "화요일"
        return label
    }()
    
    lazy var wedLabel: UILabel = {
       let label = UILabel()
        label.text = "수요일"
        return label
    }()
    
    lazy var thuLabel: UILabel = {
       let label = UILabel()
        label.text = "목요일"
        return label
    }()
    
    lazy var friLabel: UILabel = {
       let label = UILabel()
        label.text = "금요일"
        return label
    }()
    
    lazy var satLabel: UILabel = {
       let label = UILabel()
        label.text = "토요일"
        return label
    }()
    
    var amStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 50
        return stackView
    }()
    
    var pmStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 50
        return stackView
    }()
    
    lazy var monAmTextField: UITextField = {
        let textField = UITextField()
        textField.setting()
        return textField
    }()
    
    lazy var monPmTextField: UITextField = {
        let textField = UITextField()
        textField.setting()
        return textField
    }()
    
    lazy var tueAmTextField: UITextField = {
        let textField =  UITextField()
        textField.setting()
        return textField
    }()
    
    lazy var tuePmTextField: UITextField = {
        let textField =  UITextField()
        textField.setting()
        return textField
    }()
    
    lazy var wenAmTextField: UITextField = {
        let textField =  UITextField()
        textField.setting()
        return textField
    }()
    
    lazy var wenPmTextField: UITextField = {
        let textField =  UITextField()
        textField.setting()
        return textField
    }()
    
    lazy var thuAmTextField: UITextField = {
        let textField =  UITextField()
        textField.setting()
        return textField
    }()
    
    lazy var thuPmTextField: UITextField = {
        let textField =  UITextField()
        textField.setting()
        return textField
    }()
    
    lazy var friAmTextField: UITextField = {
        let textField =  UITextField()
        textField.setting()
        return textField
    }()
    
    lazy var friPmTextField: UITextField = {
        let textField =  UITextField()
        textField.setting()
        return textField
    }()
    
    lazy var satAmTextField: UITextField = {
        let textField =  UITextField()
        textField.setting()
        return textField
    }()
    
    lazy var satPmTextField: UITextField = {
        let textField =  UITextField()
        textField.setting()
        return textField
    }()
    
    lazy var calculateButton: UIButton = {
        let button = UIButton(type: UIButton.ButtonType.system)
        button.layer.cornerRadius = 15
        button.backgroundColor = .systemBackground
        button.setTitleColor(UIColor(named: "Color"), for: .normal)
        button.setTitle("이번주 무 값은?", for: UIControl.State.normal)
        button.addTarget(self, action: #selector(nextView), for: .touchUpInside)
        return button
    }()
    
    lazy var bannerView: GADBannerView = {
        let banner = GADBannerView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        return banner
    }()
        
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemGray6
        title = "무 값 입력"
        
        self.navigationItem.rightBarButtonItem = self.initButton
        
        //배너 사이즈 설정
        bannerView = GADBannerView(adSize: GADAdSizeBanner)
//        bannerView.adUnitID = "ca-app-pub-3940256099942544/2934735716" //Test
        bannerView.adUnitID = "ca-app-pub-2824710392054396/7944605171"
        bannerView.rootViewController = self
        bannerView.load(GADRequest())
        bannerView.delegate = self
        
        self.hideKeyboardWhenTappedAround()
        configure()
        stackView()
        update()
    }
    
    // MARK: Button Event
    @objc func buttonPressend(_sender: Any) {
        //초기화 해주기
        sunTextField.text = ""
        monAmTextField.text = ""
        monPmTextField.text = ""
        tueAmTextField.text = ""
        tuePmTextField.text = ""
        wenAmTextField.text = ""
        wenPmTextField.text = ""
        thuAmTextField.text = ""
        thuPmTextField.text = ""
        friAmTextField.text = ""
        friPmTextField.text = ""
        satAmTextField.text = ""
        satPmTextField.text = ""
    }
    
    @objc func nextView() {
        let nextVC = CalculateViewController()
        self.show(nextVC, sender: self)
        
        UserDefaults.standard.set(sunTextField.text, forKey: "sunday")
        UserDefaults.standard.set(monAmTextField.text, forKey: "monAM")
        UserDefaults.standard.set(monPmTextField.text, forKey: "monPM")
        UserDefaults.standard.set(tueAmTextField.text, forKey: "tueAM")
        UserDefaults.standard.set(tuePmTextField.text, forKey: "tuePM")
        UserDefaults.standard.set(wenAmTextField.text, forKey: "wenAM")
        UserDefaults.standard.set(wenPmTextField.text, forKey: "wenPM")
        UserDefaults.standard.set(thuAmTextField.text, forKey: "thuAM")
        UserDefaults.standard.set(thuPmTextField.text, forKey: "thuPM")
        UserDefaults.standard.set(friAmTextField.text, forKey: "friAM")
        UserDefaults.standard.set(friPmTextField.text, forKey: "friPM")
        UserDefaults.standard.set(satAmTextField.text, forKey: "satAM")
        UserDefaults.standard.set(satPmTextField.text, forKey: "satPM")
        
    }
    
    func update() {
        sunTextField.text = UserDefaults.standard.object(forKey: "sunday") as? String
        monAmTextField.text = UserDefaults.standard.object(forKey: "monAM") as? String
        monPmTextField.text = UserDefaults.standard.object(forKey: "monPM") as? String
        tueAmTextField.text = UserDefaults.standard.object(forKey: "tueAM") as? String
        tuePmTextField.text = UserDefaults.standard.object(forKey: "tuePM") as? String
        wenAmTextField.text = UserDefaults.standard.object(forKey: "wenAM") as? String
        wenPmTextField.text = UserDefaults.standard.object(forKey: "wenPM") as? String
        thuAmTextField.text = UserDefaults.standard.object(forKey: "thuAM") as? String
        thuPmTextField.text = UserDefaults.standard.object(forKey: "thuPM") as? String
        friAmTextField.text = UserDefaults.standard.object(forKey: "friAM") as? String
        friPmTextField.text = UserDefaults.standard.object(forKey: "friPM") as? String
        satAmTextField.text = UserDefaults.standard.object(forKey: "satAM") as? String
        satPmTextField.text = UserDefaults.standard.object(forKey: "satPM") as? String
    }
    
    func configure() {
        view.addSubview(sunView)
        sunView.translatesAutoresizingMaskIntoConstraints = false
        sunView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        sunView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        sunView.heightAnchor.constraint(equalToConstant: 70).isActive = true
        sunView.widthAnchor.constraint(equalToConstant: 350).isActive = true
        
        sunView.addSubview(sunLabel)
        sunLabel.translatesAutoresizingMaskIntoConstraints = false
        sunLabel.centerYAnchor.constraint(equalTo: sunView.centerYAnchor).isActive = true
        sunLabel.leadingAnchor.constraint(equalTo: sunView.leadingAnchor, constant: 30).isActive = true
        
        sunView.addSubview(sunTextField)
        sunTextField.translatesAutoresizingMaskIntoConstraints = false
        sunTextField.centerYAnchor.constraint(equalTo: sunView.centerYAnchor).isActive = true
        sunTextField.leadingAnchor.constraint(equalTo: sunLabel.trailingAnchor, constant: 30).isActive = true
        sunTextField.heightAnchor.constraint(equalToConstant: 30).isActive = true
        sunTextField.widthAnchor.constraint(equalToConstant: 210).isActive = true
        
        view.addSubview(restView)
        restView.translatesAutoresizingMaskIntoConstraints = false
        restView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        restView.topAnchor.constraint(equalTo: sunView.bottomAnchor, constant: 10).isActive = true
        restView.heightAnchor.constraint(equalToConstant: 500).isActive = true
        restView.widthAnchor.constraint(equalToConstant: 350).isActive = true
        
        restView.addSubview(weekStackView)
        weekStackView.translatesAutoresizingMaskIntoConstraints = false
        weekStackView.centerYAnchor.constraint(equalTo: restView.centerYAnchor).isActive = true
        weekStackView.leadingAnchor.constraint(equalTo: restView.leadingAnchor, constant: 30).isActive = true
        
        restView.addSubview(amStackView)
        amStackView.translatesAutoresizingMaskIntoConstraints = false
        amStackView.centerYAnchor.constraint(equalTo: restView.centerYAnchor).isActive = true
        amStackView.leadingAnchor.constraint(equalTo: weekStackView.trailingAnchor, constant: 30).isActive = true
        
        restView.addSubview(pmStackView)
        pmStackView.translatesAutoresizingMaskIntoConstraints = false
        pmStackView.centerYAnchor.constraint(equalTo: restView.centerYAnchor).isActive = true
        pmStackView.leadingAnchor.constraint(equalTo: amStackView.trailingAnchor, constant: 10).isActive = true
        
        view.addSubview(calculateButton)
        calculateButton.translatesAutoresizingMaskIntoConstraints = false
        calculateButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        calculateButton.topAnchor.constraint(equalTo: restView.bottomAnchor, constant: 10).isActive = true
        calculateButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        calculateButton.widthAnchor.constraint(equalToConstant: 350).isActive = true
        
        view.addSubview(bannerView)
        bannerView.translatesAutoresizingMaskIntoConstraints = false
        bannerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        bannerView.topAnchor.constraint(equalTo: calculateButton.bottomAnchor, constant: 1).isActive = true
    }
    
    func stackView() {
        [monLabel, tueLabel, wedLabel, thuLabel, friLabel, satLabel].map {
            self.weekStackView.addArrangedSubview($0)
        }
        
        [monAmTextField, tueAmTextField, wenAmTextField, thuAmTextField, friAmTextField, satAmTextField].map {
            self.amStackView.addArrangedSubview($0)
        }
        
        [monPmTextField, tuePmTextField, wenPmTextField, thuPmTextField, friPmTextField, satPmTextField].map {
            self.pmStackView.addArrangedSubview($0)
        }
    }
}

extension ViewController: GADBannerViewDelegate {
    
    func bannerViewDidReceiveAd(_ bannerView: GADBannerView) {
      print("bannerViewDidReceiveAd")
    }

    func bannerView(_ bannerView: GADBannerView, didFailToReceiveAdWithError error: Error) {
      print("bannerView:didFailToReceiveAdWithError: \(error.localizedDescription)")
    }

    func bannerViewDidRecordImpression(_ bannerView: GADBannerView) {
      print("bannerViewDidRecordImpression")
    }

    func bannerViewWillPresentScreen(_ bannerView: GADBannerView) {
      print("bannerViewWillPresentScreen")
    }

    func bannerViewWillDismissScreen(_ bannerView: GADBannerView) {
      print("bannerViewWillDIsmissScreen")
    }

    func bannerViewDidDismissScreen(_ bannerView: GADBannerView) {
      print("bannerViewDidDismissScreen")
    }
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
