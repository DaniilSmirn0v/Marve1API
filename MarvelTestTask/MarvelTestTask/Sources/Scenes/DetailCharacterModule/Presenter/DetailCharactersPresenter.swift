//
//  DetailCharactersPresenter.swift
//  MarvelTestTask
//
//  Created by Даниил Смирнов on 01.08.2022.
//

import Foundation


protocol DetailCharactersViewProtocol: AnyObject {
    func success()
    func failure(error: NetworkError)
    func setCharacter(data: Hero?)
  
}

protocol DetailCharactersPresenterProtocol: AnyObject {
    init(view: DetailCharactersViewProtocol, networkService: NetworkServiceProtocol, hero: Hero? )
    func setChar()
//    var heroInfo: HeroInfo? { get set }
}

class DetailCharactersPresenter: DetailCharactersPresenterProtocol {
    weak var view: DetailCharactersViewProtocol?
    let networkService: NetworkServiceProtocol
    var hero: Hero?
    
    required init(view: DetailCharactersViewProtocol, networkService: NetworkServiceProtocol, hero: Hero?) {
        self.view = view
        self.networkService = networkService
        self.hero = hero
    }
    
    func setChar() {
        view?.setCharacter(data: hero)
    }
}


