//
//  AppDelegate.swift
//  PaperCalculator
//
//  Created by appledev018 on 9/28/16.
//  Copyright © 2016 apple. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        DataManager.shareManager.mockData()
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let vc = MainViewController()
        self.window?.rootViewController = UINavigationController(rootViewController: vc)
        self.window?.makeKeyAndVisible()
        
        
        
        // Override point for customization after application launch.
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
    }

    func applicationWillTerminate(_ application: UIApplication) {
    }


}

