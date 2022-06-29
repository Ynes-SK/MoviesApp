//
//  AppDelegate.swift
//  MoviesApp
//
//  Created by Ines Sakly on 29/6/2022.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var fisrtCoordinator : FirstCoordinator?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UINavigationController()
        fisrtCoordinator = FirstCoordinator(navigationController: window?.rootViewController as! UINavigationController)
        fisrtCoordinator?.start()
        window?.makeKeyAndVisible()
        return true
    }
}

