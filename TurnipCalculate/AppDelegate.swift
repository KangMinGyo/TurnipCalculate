//
//  AppDelegate.swift
//  TurnipCalculate
//
//  Created by Kang on 2022/02/12.
//

import UIKit
import GoogleMobileAds
import AdSupport
import AppTrackingTransparency

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        GADMobileAds.sharedInstance().start(completionHandler: nil)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    if #available(iOS 14, *) {
                        ATTrackingManager.requestTrackingAuthorization { status in
                            switch status {
                            case .authorized:
                                print("Authorized")
                                print("IDFA = \(ASIdentifierManager.shared().advertisingIdentifier)")
                            case .denied:
                                print("Denied")
                            case .notDetermined:
                                print("Not Determined")
                            case .restricted:
                                print("Restricted")
                            @unknown default:
                                print("Unknow")
                            }
                        }
                    }
        }
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

