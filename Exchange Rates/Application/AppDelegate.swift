//
//  AppDelegate.swift
//  Exchange Rates
//
//  Created by Павел Галкин on 13.04.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        if #available(iOS 15.0, *) {
            UITableView.appearance().sectionHeaderTopPadding = 0.0
        }
        window = UIWindow(frame: UIScreen.main.bounds)
        let vc = DateModuleBuilder.build()
        window?.rootViewController = vc
        window?.makeKeyAndVisible()
        return true
    }
}

