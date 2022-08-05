//
//  DetailCharacterViewController.swift
//  MarvelTestTask
//
//  Created by Даниил Смирнов on 29.07.2022.
//

import UIKit
//import CoreMedia

class DetailCharacterViewController: UIViewController {
    
    //MARK: - Properties
    private var detailCharacterCollectionView: DetailCharacterCollectionView? {
        guard isViewLoaded else { return nil }
        return view as? DetailCharacterCollectionView
    }
    
    var presenter: DetailCharactersPresenterProtocol?
    
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setComics()
        setupView()
        setupNavigationController()
    }
    
    //MARK: - Settings
    private func setupView() {
        view = DetailCharacterCollectionView()
        detailCharacterCollectionView?.collectionView.delegate = self
        detailCharacterCollectionView?.collectionView.dataSource = self
    }
    
    private func setupNavigationController() {
        title = presenter?.hero.name
    }
}
//MARK: - UICollectionViewDataSource

extension DetailCharacterViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        presenter?.hero.comics?.items?.count ?? 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ContentCollectionCell.reuseID,
                                                            for: indexPath)
                as? ContentCollectionCell else { return UICollectionViewCell()}
        let comics = presenter?.comics
        print(comics)
//        cell.descriptionLabel.text = comics?.name
       
       
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard  let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader,
                                                                            withReuseIdentifier: DetailCharacterHeaderView.reuseID,
                                                                            for: indexPath)
                as? DetailCharacterHeaderView else { return DetailCharacterHeaderView() }
    
        guard let urlString = presenter?.hero.image?.url else { return UICollectionReusableView()}
        header.nameDataLabel.text = presenter?.hero.name

        header.descriptionDataLabel.text = presenter?.hero.description != ""
        ? presenter?.hero.description
        : "Glorious description is missing!:>"

        if urlString == "http://i.annihil.us/u/prod/marvel/i/mg/b/40/image_not_available.jpg" {
            header.imageView.image = UIImage(named: "tony")
        } else {
            DispatchQueue.main.async {
                header.imageView.download(image: urlString)
            }
        }

        return header
    }

}

//MARK: - UICollectionViewDelegate

extension DetailCharacterViewController: UICollectionViewDelegate {
    
}

//MARK: - DetailCharactersViewProtocol

extension DetailCharacterViewController: DetailCharactersViewProtocol {
    func setComics() {
        presenter?.setComics()
        
    }
    

    
    func failure(error: NetworkError) {
        
        let action = UIAlertAction(title: "Ok", style: .default, handler: (fetchDataAgain))
        showAlert(title: "Error", message: error.errorDescription, actions: [action])
    }
    
    func fetchDataAgain(action: UIAlertAction) {
            presenter?.fetchComicsData()
        }

    
    func success() {
        detailCharacterCollectionView?.collectionView.reloadData()
    }
    
    
    
    
}
