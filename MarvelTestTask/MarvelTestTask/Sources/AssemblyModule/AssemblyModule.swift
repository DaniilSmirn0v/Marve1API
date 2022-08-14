//
//  ModuleBuilder.swift
//  MarvelTestTask
//
//  Created by Даниил Смирнов on 01.08.2022.
//

import Foundation
import UIKit

protocol AssemblyModuleProtocol {
    func createCharactersViewController(router: RouterModuleProtocol) -> UIViewController
    func createDetailCharacterViewController(hero: Character, router: RouterModuleProtocol) -> UIViewController
}

class AssemblyModule: AssemblyModuleProtocol {
    
    func createCharactersViewController(router: RouterModuleProtocol) -> UIViewController {
        let view = CharactersViewController()
        let networkService = NetworkService()
        let presenter = CharactersPresenter(view: view, networking: networkService, router: router)
        view.presenter = presenter
        return view
    }
    
    func createDetailCharacterViewController(hero: Character, router: RouterModuleProtocol) -> UIViewController {
        let view = DetailCharacterViewController()
        let networkService = NetworkService()
        let presenter = DetailCharactersPresenter(view: view, hero: hero, router: router, networkService: networkService)
        view.presenter = presenter
        return view
    }
    
    
}
