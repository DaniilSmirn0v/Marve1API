//
//  CharactersPresenter.swift
//  MarvelTestTask
//
//  Created by Даниил Смирнов on 31.07.2022.
//

import UIKit

protocol CharactersViewProtocol: AnyObject {
    func success()
    func failure(error: NetworkError)
}

protocol CharactersPresenterProtocol: AnyObject {
    init(view: CharactersViewProtocol, networking: NetworkServiceProtocol, router: RouterModuleProtocol)
    var marvelData: MarvelInfo? {get set}
    func fetchCharactersData()
    func tapOnTheRow(hero: Hero?)
}


class CharactersPresenter: CharactersPresenterProtocol {
   
    weak var view: CharactersViewProtocol?
    let networking: NetworkServiceProtocol?
    var marvelData: MarvelInfo?
    let router: RouterModuleProtocol?
    required init(view: CharactersViewProtocol, networking: NetworkServiceProtocol, router: RouterModuleProtocol) {
        self.view = view
        self.networking = networking
        self.router = router
        fetchCharactersData()
    }
    
    func fetchCharactersData() {
        networking?.fetchCharactersData() { [weak self] result in
            DispatchQueue.main.async {
                guard let self = self else {return }
                switch result {
                case let .success(mdata):
                    self.marvelData = mdata
                    self.view?.success()
                case let .failure(error):
                    self.view?.failure(error: error)
                }
                return
            }
        }
    }
    
    func tapOnTheRow(hero: Hero?) {
        router?.showDetailCharacterViewController(hero: hero)
    }
    
}
                                  
                                  
                                  
                                  
