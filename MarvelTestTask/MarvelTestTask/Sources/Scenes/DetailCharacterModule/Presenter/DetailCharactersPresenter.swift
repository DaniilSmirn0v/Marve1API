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
    init(view: DetailCharactersViewProtocol, hero: Hero? )
    func setChar()
}

class DetailCharactersPresenter: DetailCharactersPresenterProtocol {
    weak var view: DetailCharactersViewProtocol?
    var hero: Hero?
    
    required init(view: DetailCharactersViewProtocol, hero: Hero?) {
        self.view = view
        self.hero = hero
    }
    
    func setChar() {
        view?.setCharacter(data: hero)
    }
}


