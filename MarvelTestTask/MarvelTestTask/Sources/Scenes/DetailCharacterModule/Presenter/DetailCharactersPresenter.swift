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
    func setComics()
  
}

protocol DetailCharactersPresenterProtocol: AnyObject {
    init(view: DetailCharactersViewProtocol, hero: Character, router: RouterModuleProtocol, networkService: NetworkServiceProtocol?)
    var comics: [Character]? { get set }
    var hero: Character { get set }
    func setComics()
    func fetchComicsData()
}

class DetailCharactersPresenter: DetailCharactersPresenterProtocol {
   
    weak var view: DetailCharactersViewProtocol?
    var networkService: NetworkServiceProtocol?
    var hero: Character
    var comics: [Character]?
    let router: RouterModuleProtocol?
    
    required init(view: DetailCharactersViewProtocol, hero: Character, router: RouterModuleProtocol, networkService: NetworkServiceProtocol?) {
        self.view = view
        self.router = router
        self.networkService = networkService
        self.hero = hero
        setComics()
    }
    
    
    func fetchComicsData() {
        let heroId = "\(hero.id ?? 0)"
        networkService?.fetchComicsData(with: heroId) { [weak self] result in
            DispatchQueue.main.async {
                guard let self = self else { return }
                switch result {
                case let .success(data):
                    self.comics? = data
                    print(self.comics)
                    self.view?.success()
                case let .failure(error):
                    self.view?.failure(error: error)
                }
            }
            
        }
    }
    
    func setComics() {
        fetchComicsData()
    }
    
}


