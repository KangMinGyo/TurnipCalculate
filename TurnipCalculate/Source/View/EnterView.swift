//
//  EnterView.swift
//  TurnipCalculate
//
//  Created by KangMingyo on 2022/11/02.
//

import UIKit
import GoogleMobileAds
import AppTrackingTransparency

class EnterView: UIView {
    
    lazy var sunView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        view.layer.cornerRadius = 15
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var sunLabel: UILabel = {
        let label = UILabel()
        label.text = "일요일"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var sunTextField: UITextField = {
        let textField = UITextField()
        textField.layer.cornerRadius = 10
        textField.backgroundColor = .systemGray6
        textField.textAlignment = .center
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    lazy var restView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        view.layer.cornerRadius = 15
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var weekStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 60
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var monLabel: UILabel = {
        let label = UILabel()
        label.text = "월요일"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var tueLabel: UILabel = {
        let label = UILabel()
        label.text = "화요일"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var wedLabel: UILabel = {
        let label = UILabel()
        label.text = "수요일"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var thuLabel: UILabel = {
        let label = UILabel()
        label.text = "목요일"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var friLabel: UILabel = {
        let label = UILabel()
        label.text = "금요일"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var satLabel: UILabel = {
        let label = UILabel()
        label.text = "토요일"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var amStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 50
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    var pmStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 50
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var monAmTextField: UITextField = {
        let textField = UITextField()
        textField.setting()
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    lazy var monPmTextField: UITextField = {
        let textField = UITextField()
        textField.setting()
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    lazy var tueAmTextField: UITextField = {
        let textField =  UITextField()
        textField.setting()
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    lazy var tuePmTextField: UITextField = {
        let textField =  UITextField()
        textField.setting()
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    lazy var wenAmTextField: UITextField = {
        let textField =  UITextField()
        textField.setting()
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    lazy var wenPmTextField: UITextField = {
        let textField =  UITextField()
        textField.setting()
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    lazy var thuAmTextField: UITextField = {
        let textField =  UITextField()
        textField.setting()
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    lazy var thuPmTextField: UITextField = {
        let textField =  UITextField()
        textField.setting()
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    lazy var friAmTextField: UITextField = {
        let textField =  UITextField()
        textField.setting()
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    lazy var friPmTextField: UITextField = {
        let textField =  UITextField()
        textField.setting()
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    lazy var satAmTextField: UITextField = {
        let textField =  UITextField()
        textField.setting()
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    lazy var satPmTextField: UITextField = {
        let textField =  UITextField()
        textField.setting()
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    lazy var calculateButton: UIButton = {
        let button = UIButton(type: UIButton.ButtonType.system)
        button.layer.cornerRadius = 15
        button.backgroundColor = .systemBackground
        button.setTitleColor(UIColor(named: "Color"), for: .normal)
        button.setTitle("이번주 무 값은?", for: UIControl.State.normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addView()
        stackView()
        configure()
    }
    
    required init?(coder NSCoder : NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func stackView() {
        [monLabel, tueLabel, wedLabel, thuLabel, friLabel, satLabel].forEach {
            self.weekStackView.addArrangedSubview($0)
        }
        
        [monAmTextField, tueAmTextField, wenAmTextField, thuAmTextField, friAmTextField, satAmTextField].forEach {
            self.amStackView.addArrangedSubview($0)
        }
        
        [monPmTextField, tuePmTextField, wenPmTextField, thuPmTextField, friPmTextField, satPmTextField].forEach {
            self.pmStackView.addArrangedSubview($0)
        }
    }
    
    func addView() {
        addSubview(sunView)
        sunView.addSubview(sunLabel)
        sunView.addSubview(sunTextField)
        
        addSubview(restView)
        restView.addSubview(weekStackView)
        restView.addSubview(amStackView)
        restView.addSubview(pmStackView)
        
        addSubview(calculateButton)
    }
    
    
    func configure() {
        NSLayoutConstraint.activate([
            
            sunView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            sunView.centerXAnchor.constraint(equalTo: centerXAnchor),
            sunView.heightAnchor.constraint(equalToConstant: 70),
            sunView.widthAnchor.constraint(equalToConstant: 350),
            
            sunLabel.centerYAnchor.constraint(equalTo: sunView.centerYAnchor),
            sunLabel.leadingAnchor.constraint(equalTo: sunView.leadingAnchor, constant: 30),
            
            sunTextField.centerYAnchor.constraint(equalTo: sunView.centerYAnchor),
            sunTextField.leadingAnchor.constraint(equalTo: sunLabel.trailingAnchor, constant: 30),
            sunTextField.heightAnchor.constraint(equalToConstant: 30),
            sunTextField.widthAnchor.constraint(equalToConstant: 210),
            
            restView.centerXAnchor.constraint(equalTo: centerXAnchor),
            restView.topAnchor.constraint(equalTo: sunView.bottomAnchor, constant: 10),
            restView.heightAnchor.constraint(equalToConstant: 500),
            restView.widthAnchor.constraint(equalToConstant: 350),
            
            weekStackView.centerYAnchor.constraint(equalTo: restView.centerYAnchor),
            weekStackView.leadingAnchor.constraint(equalTo: restView.leadingAnchor, constant: 30),
            
            amStackView.centerYAnchor.constraint(equalTo: restView.centerYAnchor),
            amStackView.leadingAnchor.constraint(equalTo: weekStackView.trailingAnchor, constant: 30),
            
            pmStackView.centerYAnchor.constraint(equalTo: restView.centerYAnchor),
            pmStackView.leadingAnchor.constraint(equalTo: amStackView.trailingAnchor, constant: 10),
            
            calculateButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            calculateButton.topAnchor.constraint(equalTo: restView.bottomAnchor, constant: 10),
            calculateButton.heightAnchor.constraint(equalToConstant: 50),
            calculateButton.widthAnchor.constraint(equalToConstant: 350)

        ])
    }
}

