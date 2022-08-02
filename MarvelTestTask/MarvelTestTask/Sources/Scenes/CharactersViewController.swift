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
        setupNavigationController()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.fetchCharactersData()

    }
    
    //MARK: - Settings
    private func setupView() {
        view = CharactersView()
        charactersView?.activityIndicatorView.startAnimating()

        charactersView?.collectionView.delegate = self
        charactersView?.collectionView.dataSource = self
    }
    
    private func setupNavigationController() {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        title = "Characters"
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
        
        cell.activityIndicatorView.startAnimating()
        
        DispatchQueue.main.async {
            cell.imageView.download(image: urlString)
            cell.activityIndicatorView.stopAnimating()
        }
        
        cell.characterLabel.text = char?.name
        
        return cell
    }
}

//MARK: - CharactersViewProtocol
extension CharactersViewController: CharactersViewProtocol {
    func success() {
        
        DispatchQueue.main.async{ [self] in
            charactersView?.activityIndicatorView.startAnimating()
            charactersView?.collectionView.reloadData()
            charactersView?.blurView.isHidden = true
            charactersView?.activityIndicatorView.stopAnimating()
        }
    }
    
    
    func failure(error: NetworkError) {
        print(error.errorDescription as Any)
    }
    
    
    
    
}
