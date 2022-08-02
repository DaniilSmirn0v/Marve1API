//
//  DetailCharactersPresenter.swift
//  MarvelTestTask
//
//  Created by Даниил Смирнов on 01.08.2022.
//

import Foundation


protocol DetailCharactersViewProtocol: AnyObject {
    func success()
    func setCharacter(data: Hero?)
  
}

protocol DetailCharactersPresenterProtocol: AnyObject {
    init(view: DetailCharactersViewProtocol, hero: Hero?, router: RouterModuleProtocol )
    func setChar()
}

class DetailCharactersPresenter: DetailCharactersPresenterProtocol {
    weak var view: DetailCharactersViewProtocol?
    var hero: Hero?
    let router: RouterModuleProtocol?
    required init(view: DetailCharactersViewProtocol, hero: Hero?, router: RouterModuleProtocol) {
        self.view = view
        self.hero = hero
        self.router = router
    }
    
    func setChar() {
        view?.setCharacter(data: hero)
    }
}


