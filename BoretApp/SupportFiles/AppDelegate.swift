//
//  AppDelegate.swift
//  BoretApp
//
//  Created by Saul Corona Santos on 03/11/21.
//

import UIKit
import ProgressHUD

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        configProgressHUD()
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

extension AppDelegate {
    
    func configProgressHUD() {
        ProgressHUD.animationType = .circleStrokeSpin
        ProgressHUD.colorBackground = .clear
        ProgressHUD.colorHUD = UIColor(red: 34/255, green: 229/255, blue: 171/255, alpha: 1)
        ProgressHUD.colorAnimation = UIColor(red: 34/255, green: 229/255, blue: 171/255, alpha: 1)
    }
}
