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
    
    var characters: MarvelInfo? { get set }
    var character: Character? { get set }
    var filteredHero: [Character]? { get set }
    
    func fetchCharactersData()
    func tapOnTheRow(character: Character)
    func filterContentForSearchText(searchText: String)
}


class CharactersPresenter: CharactersPresenterProtocol {
   
    weak var view: CharactersViewProtocol?
    let networking: NetworkServiceProtocol?
    let router: RouterModuleProtocol?
    
    var characters: MarvelInfo?
    var character: Character?
    var filteredHero: [Character]?
    
    
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
                case let .success(data):
                    self.characters = data
                    self.view?.success()
                case let .failure(error):
                    self.view?.failure(error: error)
                }
                return
            }
        }
    }
    
    func tapOnTheRow(character: Character) {
        router?.showDetailCharacterViewController(hero: character)
    }
    
    func filterContentForSearchText(searchText: String) {
        filteredHero = characters?.data.results.filter {(hero: Character) -> Bool in
            return (hero.name?.lowercased().contains(searchText.lowercased()))!
        }
    }
}
                                  
                                  
                                  
                                  
