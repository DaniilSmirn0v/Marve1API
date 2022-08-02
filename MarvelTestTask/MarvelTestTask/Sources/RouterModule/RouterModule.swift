//
//  RouterModule.swift
//  MarvelTestTask
//
//  Created by Даниил Смирнов on 02.08.2022.
//

import UIKit

protocol RouterMain {
    var navigationController: UINavigationController? {get set}
    var assemblyModule: AssemblyModuleProtocol? { get set}
    
    init(navigationController: UINavigationController, assemblyModule: AssemblyModuleProtocol)
}

protocol RouterModuleProtocol: RouterMain {
    func initialViewController()
    func showDetailCharacterViewController(hero: Hero?)
    func popToRootViewController()
}

class RouterModule : RouterModuleProtocol {
    
    var navigationController: UINavigationController?
    
    var assemblyModule: AssemblyModuleProtocol?
    
    required init(navigationController: UINavigationController, assemblyModule: AssemblyModuleProtocol) {
        self.navigationController = navigationController
        self.assemblyModule = assemblyModule
    }
    
    
    
    func initialViewController() {
        if let navigationController = navigationController {
            guard let charactersViewController = assemblyModule?.createCharactersViewController(router: self) else { return }
            navigationController.viewControllers = [charactersViewController]
        }
    }
    
    func showDetailCharacterViewController(hero: Hero?) {
        if let navigationController = navigationController {
            guard let detailCharacterViewController = assemblyModule?.createDetailCharacterViewController(hero: hero, router: self) else { return }
            navigationController.pushViewController(detailCharacterViewController, animated: true)
            let backButton = UIBarButtonItem()
            detailCharacterViewController.navigationController?.navigationBar.tintColor = .white
            detailCharacterViewController.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        }
        
    }
    
    func popToRootViewController() {
        if let navigationController = navigationController {
            navigationController.popToRootViewController(animated: true)
        }
    }
    
 
    
    
}
