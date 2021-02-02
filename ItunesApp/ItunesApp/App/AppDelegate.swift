//
//  AppDelegate.swift
//  ItunesApp
//
//  Created by Farid Guliyev on 26.01.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        startApp()
        return true
    }
    
    func startApp() {
        ServiceLocator.shared.createContainer()
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = TabBarAssembly.module()
        window?.makeKeyAndVisible()
    }
}

