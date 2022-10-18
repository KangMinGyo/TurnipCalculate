//
//  OnboardingViewController.swift
//  TurnipCalculate
//
//  Created by KangMingyo on 2022/09/19.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    lazy var titleLabel: UILabel = {
       let label = UILabel()
        label.text = "Permission Request"
        label.font = UIFont(name: "Verdana", size: 30)
        return label
        //Apple SD Gothic Neo
    }()
    
    lazy var permissonImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "permission")
        return image
    }()
    
    lazy var textView: UITextView = {
       let textView = UITextView()
        textView.text = "개인에게 최적화된 광고를 제공하기 위해\n 사용자의 광고 활동 정보를 수집합니다.\n 앞으로도 앱을 무료로 제공할 수 있도록\n 이해와 협조 부탁드립니다! \n \n We collect information about your advertising activity to provide you with personalized advertising."
        textView.textAlignment = .center
        textView.textColor = .black
        textView.font = UIFont.systemFont(ofSize: 15)
        return textView
    }()
    
    lazy var nextButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 15
        button.backgroundColor = .systemBlue
        button.setTitleColor(UIColor(named: "Color"), for: .normal)
        button.setTitle("Next", for: UIControl.State.normal)
        //button.addTarget(self, action: #selector(nextView), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        addView()
        configure()
    }
    
    func isFirstTime() -> Bool {
        let defaults = UserDefaults.standard
        if defaults.object(forKey: "isFirstTime") == nil {
            defaults.set("No", forKey: "isFirstTime")
            return true
        } else {
            return false
        }
    }
    
    func addView() {
        view.addSubview(titleLabel)
        view.addSubview(permissonImage)
        view.addSubview(textView)
        view.addSubview(nextButton)
    }
    
    func configure() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
        
        permissonImage.translatesAutoresizingMaskIntoConstraints = false
        permissonImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        permissonImage.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 50).isActive = true

        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.topAnchor.constraint(equalTo: permissonImage.bottomAnchor, constant: 20).isActive = true
        textView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        textView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        textView.widthAnchor.constraint(equalToConstant:  350).isActive = true

        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nextButton.topAnchor.constraint(equalTo: textView.bottomAnchor, constant: 20).isActive = true
        nextButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        nextButton.widthAnchor.constraint(equalToConstant: 300).isActive = true
    }
}
