//
//  ViewController.swift
//  TurnipCalculate
//
//  Created by Kang on 2022/02/12.
//

import UIKit
import GoogleMobileAds
import AppTrackingTransparency

class EnterViewController: UIViewController {
    
    lazy var initButton: UIBarButtonItem = {
        let button = UIBarButtonItem(barButtonSystemItem: .refresh,
                                     target: self,
                                     action: #selector(buttonPressend))
        button.tintColor = .black
        return button
    }()
    
    lazy var enterView: EnterView = {
        let view = EnterView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var bannerView: GADBannerView = {
        let banner = GADBannerView()
        banner.translatesAutoresizingMaskIntoConstraints = false
        return banner
    }()
        
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "무 값 입력"
        view.backgroundColor = .systemGray6
        
        self.navigationItem.rightBarButtonItem = self.initButton
        enterView.calculateButton.addTarget(self, action: #selector(nextView), for: .touchUpInside)
        
        self.hideKeyboardWhenTappedAround()
        setupBanner()
        addSubView()
        configure()
        update()
    }
    
    // MARK: Button Event
    @objc func buttonPressend(_sender: Any) {
        enterView.sunTextField.text = ""
        enterView.monAmTextField.text = ""
        enterView.monPmTextField.text = ""
        enterView.tueAmTextField.text = ""
        enterView.tuePmTextField.text = ""
        enterView.wenAmTextField.text = ""
        enterView.wenPmTextField.text = ""
        enterView.thuAmTextField.text = ""
        enterView.thuPmTextField.text = ""
        enterView.friAmTextField.text = ""
        enterView.friPmTextField.text = ""
        enterView.satAmTextField.text = ""
        enterView.satPmTextField.text = ""
    }
    
    @objc func nextView() {
        let nextVC = CalculateViewController()
        self.show(nextVC, sender: self)
        
        UserDefaults.standard.set(enterView.sunTextField.text, forKey: "sunday")
        UserDefaults.standard.set(enterView.monAmTextField.text, forKey: "monAM")
        UserDefaults.standard.set(enterView.monPmTextField.text, forKey: "monPM")
        UserDefaults.standard.set(enterView.tueAmTextField.text, forKey: "tueAM")
        UserDefaults.standard.set(enterView.tuePmTextField.text, forKey: "tuePM")
        UserDefaults.standard.set(enterView.wenAmTextField.text, forKey: "wenAM")
        UserDefaults.standard.set(enterView.wenPmTextField.text, forKey: "wenPM")
        UserDefaults.standard.set(enterView.thuAmTextField.text, forKey: "thuAM")
        UserDefaults.standard.set(enterView.thuPmTextField.text, forKey: "thuPM")
        UserDefaults.standard.set(enterView.friAmTextField.text, forKey: "friAM")
        UserDefaults.standard.set(enterView.friPmTextField.text, forKey: "friPM")
        UserDefaults.standard.set(enterView.satAmTextField.text, forKey: "satAM")
        UserDefaults.standard.set(enterView.satPmTextField.text, forKey: "satPM")
        
    }
    
    func update() {
        enterView.sunTextField.text = UserDefaults.standard.object(forKey: "sunday") as? String
        enterView.monAmTextField.text = UserDefaults.standard.object(forKey: "monAM") as? String
        enterView.monPmTextField.text = UserDefaults.standard.object(forKey: "monPM") as? String
        enterView.tueAmTextField.text = UserDefaults.standard.object(forKey: "tueAM") as? String
        enterView.tuePmTextField.text = UserDefaults.standard.object(forKey: "tuePM") as? String
        enterView.wenAmTextField.text = UserDefaults.standard.object(forKey: "wenAM") as? String
        enterView.wenPmTextField.text = UserDefaults.standard.object(forKey: "wenPM") as? String
        enterView.thuAmTextField.text = UserDefaults.standard.object(forKey: "thuAM") as? String
        enterView.thuPmTextField.text = UserDefaults.standard.object(forKey: "thuPM") as? String
        enterView.friAmTextField.text = UserDefaults.standard.object(forKey: "friAM") as? String
        enterView.friPmTextField.text = UserDefaults.standard.object(forKey: "friPM") as? String
        enterView.satAmTextField.text = UserDefaults.standard.object(forKey: "satAM") as? String
        enterView.satPmTextField.text = UserDefaults.standard.object(forKey: "satPM") as? String
    }
    
    func setupBanner() {
        bannerView = GADBannerView(adSize: GADAdSizeBanner)
        bannerView.adUnitID = "ca-app-pub-2824710392054396/7944605171"
        bannerView.rootViewController = self
        bannerView.load(GADRequest())
        bannerView.delegate = self
        bannerView.frame = CGRectMake(0,
                                      self.view.frame.size.height-bannerView.frame.size.height-30,
                                      view.frame.size.width,
                                      bannerView.frame.size.height)
    }
    
    func addSubView() {
        view.addSubview(enterView)
        view.addSubview(bannerView)
    }
    
    func configure() {
        NSLayoutConstraint.activate([
            
            enterView.topAnchor.constraint(equalTo: view.topAnchor),
            enterView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            enterView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            enterView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}

extension EnterViewController: GADBannerViewDelegate {
    
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
