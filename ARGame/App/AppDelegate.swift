//
//  AppDelegate.swift
//  ARGame
//
//  Created by Maxim Tolstikov on 30.10.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setupWindow()
        return true
    }
    
    private func setupWindow() {
        self.window = window ?? UIWindow()
        let gameViewController = ModuleFactory.buildStartScreen()
        window?.rootViewController = UINavigationController(rootViewController: gameViewController)
        window?.makeKeyAndVisible()
    }
}

