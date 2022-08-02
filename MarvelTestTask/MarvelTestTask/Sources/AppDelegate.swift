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
let navigationController = UINavigationController()
let assemblyModule = AssemblyModule()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let router = RouterModule(navigationController: navigationController, assemblyModule: assemblyModule)
        router.initialViewController()
        
        navigationController.navigationBar.isTranslucent = true
        
        window?.overrideUserInterfaceStyle = .dark
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        return true
    }



}

