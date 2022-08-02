//
//  ModuleBuilder.swift
//  MarvelTestTask
//
//  Created by Даниил Смирнов on 01.08.2022.
//

import Foundation
import UIKit

protocol ModuleBuilderProtocol {
    static func createCharactersViewController() -> UIViewController
    static func createDetailCharacterViewController(hero: Hero?) -> UIViewController
}

class ModuleBuilder: ModuleBuilderProtocol {
   
    static func createCharactersViewController() -> UIViewController {
        let view = CharactersViewController()
        let networkService = NetworkService()
        let presenter = CharactersPresenter(view: view, networking: networkService)
        view.presenter = presenter
        return view
    }
    
    static func createDetailCharacterViewController(hero: Hero?) -> UIViewController {
        let view = DetailCharacterViewController()
        let presenter = DetailCharactersPresenter(view: view, hero: hero)
        view.presenter = presenter
        return view
    }
    
    
}
