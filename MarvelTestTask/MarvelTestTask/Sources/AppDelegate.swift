//
//  AppDelegate.swift
//  MarvelTestTask
//
//  Created by Даниил Смирнов on 29.07.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let rootViewController = CharactersViewController()
        
        let navigaionViewController = UINavigationController(rootViewController: rootViewController)
        navigaionViewController.navigationBar.isTranslucent = true
        window?.overrideUserInterfaceStyle = .dark
        window?.rootViewController = navigaionViewController
        window?.makeKeyAndVisible()
        return true
    }



}

