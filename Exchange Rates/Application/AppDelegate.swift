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
 
        window = UIWindow(frame: UIScreen.main.bounds)
        let vc = DateModuleBuilder.build()
        window?.rootViewController = vc
        window?.makeKeyAndVisible()
        return true
    }
}

