//
//  SceneDelegate.swift
//  Exchange Storyboard
//
//  Created by Павел Галкин on 17.06.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    @available(iOS 13.0, *)
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        let vc = DateModuleBuilder.build()
        window.rootViewController = vc
        self.window = window
        window.makeKeyAndVisible()
    }
    @available(iOS 13.0, *)
    func sceneDidDisconnect(_ scene: UIScene) {

    }
    @available(iOS 13.0, *)
    func sceneDidBecomeActive(_ scene: UIScene) {

    }
    @available(iOS 13.0, *)
    func sceneWillResignActive(_ scene: UIScene) {

    }
    @available(iOS 13.0, *)
    func sceneWillEnterForeground(_ scene: UIScene) {

    }
    @available(iOS 13.0, *)
    func sceneDidEnterBackground(_ scene: UIScene) {

    }
}

