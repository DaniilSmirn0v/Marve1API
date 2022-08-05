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
        detailCharacterCollectionView?.activityIndicatorView.startAnimating()
        detailCharacterCollectionView?.collectionView.dataSource = self
    }
    
    private func setupNavigationController() {
        title = presenter?.hero.name
    }
    
}
//MARK: - UICollectionViewDataSource

extension DetailCharacterViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        presenter?.comics?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ContentCollectionCell.reuseID,
                                                            for: indexPath)
                as? ContentCollectionCell else { return UICollectionViewCell()}
        

        
        let comics = presenter?.comics?[indexPath.item]
        let comicsName = presenter?.hero.comics?.items?[indexPath.item].name
        let comicsImage = comics?.image?.portraitMedium
        cell.descriptionLabel.text = comicsName
        cell.imageView.image = comicsImage
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard  let mainheader = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader,
                                                                            withReuseIdentifier: DetailCharacterHeaderView.reuseID,
                                                                            for: indexPath)
                as? DetailCharacterHeaderView else { return DetailCharacterHeaderView() }
    
        let characterImage = presenter?.hero.image?.largeImage
        mainheader.nameDataLabel.text = presenter?.hero.name
        mainheader.descriptionDataLabel.text = presenter?.hero.description != ""
        ? presenter?.hero.description
        : "Glorious description is missing!:>"

        mainheader.imageView.image = characterImage

        return mainheader
    }

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
        
        DispatchQueue.main.async {
            self.detailCharacterCollectionView?.blackBlureView.isHidden = true
        }
        
        detailCharacterCollectionView?.activityIndicatorView.stopAnimating()
        detailCharacterCollectionView?.collectionView.reloadData()
    }
    
    
    
    
}
