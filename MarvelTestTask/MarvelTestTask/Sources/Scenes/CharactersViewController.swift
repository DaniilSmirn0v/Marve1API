//
//  CharactersViewController.swift
//  MarvelTestTask
//
//  Created by Даниил Смирнов on 29.07.2022.
//

import Foundation
import UIKit
import Kingfisher

class CharactersViewController: UIViewController {
    
    //MARK: - Properties
    
    private var charactersView: CharactersView? {
        guard isViewLoaded else { return nil }
        return view as? CharactersView
    }
    
    var presenter: CharactersPresenterProtocol?
    //MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
        
    }
    
    //MARK: - Settings
    private func setupView() {
        view = CharactersView()
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        title = "Characters"
        presenter?.fetchCharactersData()
        charactersView?.collectionView.delegate = self
        charactersView?.collectionView.dataSource = self
    }
}

//MARK: - UICollectionViewDelegate
extension CharactersViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let hero = presenter?.marvelData?.data.results[indexPath.item]
        presenter?.tapOnTheRow(hero: hero)
    }
}


//MARK: - UICollectionViewDataSource
extension CharactersViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        presenter?.marvelData?.data.results.count ?? 0
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.reuseID, for: indexPath)
                as? CustomCollectionViewCell else { return CustomCollectionViewCell() }
        let char = presenter?.marvelData?.data.results[indexPath.item]
        let urlString = char?.thumbnail.url ?? ""
      
        DispatchQueue.main.async {
            cell.imageView.download(image: urlString)
        }
     
        cell.characterLabel.text = char?.name
        
        return cell
    }
    
}

//MARK: - CharactersViewProtocol
extension CharactersViewController: CharactersViewProtocol {
    func success() {
        charactersView?.collectionView.reloadData()
    }
    
    func failure(error: NetworkError) {
        print(error.errorDescription as Any)
    }
    
    
    
    
}
