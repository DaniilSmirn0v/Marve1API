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
    
    private lazy var searchController: UISearchController = {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search by name starts here"
        searchController.definesPresentationContext = true
        searchController.searchResultsUpdater = self
        return searchController
    }()
    
    var presenter: CharactersPresenterProtocol?
    
    var isSearchBarEmpty: Bool {
        searchController.searchBar.text?.isEmpty ?? true
    }
    
    var isFiltering: Bool {
        searchController.isActive && !isSearchBarEmpty
    }
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.fetchCharactersData()
        setupView()
        setupNavigationController()
    }
    
    //MARK: - Settings
    private func setupView() {
        view = CharactersView()
        navigationItem.searchController = searchController
        charactersView?.activityIndicatorView.startAnimating()
        charactersView?.collectionView.delegate = self
        charactersView?.collectionView.dataSource = self
    }
    
    private func setupNavigationController() {
        title = "Characters"
    }
}

//MARK: - UICollectionViewDelegate
extension CharactersViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard var character = presenter?.characters?.data.results[indexPath.item] else { return }
        if isFiltering {
            character = presenter?.filteredHero?[indexPath.item] ?? character
        } else {
            character = presenter?.character ?? character
        }
        presenter?.tapOnTheRow(character: character)
        
    }
}

//MARK: - UICollectionViewDataSource
extension CharactersViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if isFiltering {
            return presenter?.filteredHero?.count ?? 0
        }
        return presenter?.characters?.data.results.count ?? 0
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.reuseID, for: indexPath)
                as? CustomCollectionViewCell else { return CustomCollectionViewCell() }
        
        var hero = presenter?.character
        
        if isFiltering {
            hero = presenter?.filteredHero?[indexPath.item]
        } else {
            hero = presenter?.characters?.data.results[indexPath.item]
        }
        
        let urlString = hero?.image?.url ?? ""
        
        cell.characterLabel.text = hero?.name
        
        cell.activityIndicatorView.startAnimating()
        if urlString == "http://i.annihil.us/u/prod/marvel/i/mg/b/40/image_not_available.jpg" {
            cell.imageView.image = UIImage(named: "tony")
            cell.activityIndicatorView.stopAnimating()
        } else {
            DispatchQueue.main.async {
                cell.imageView.download(image: urlString)
                cell.activityIndicatorView.stopAnimating()
            }
        }
        
        return cell
    }
}

//MARK: - CharactersViewProtocol
extension CharactersViewController: CharactersViewProtocol {
    func success() {
        charactersView?.activityIndicatorView.startAnimating()
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            self.charactersView?.blurView.isHidden = true
        }
        
        charactersView?.activityIndicatorView.stopAnimating()
        charactersView?.collectionView.reloadData()
    }
    
    func failure(error: NetworkError) {
        showError(error: error)
    }
}

//MARK: - Alert Controller
extension CharactersViewController {
    func showError(error: NetworkError) {
        charactersView?.blurView.isHidden = false
        let action = UIAlertAction(title: "okey:<", style: .default, handler: (repeatedRequest))
        showAlert(title: "Whats the hell????", message: error.errorDescription, actions: [action])
    }
    
    func repeatedRequest(action: UIAlertAction) {
        presenter?.fetchCharactersData()
    }
}

//MARK: - SearchResults
extension CharactersViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        presenter?.filterContentForSearchText(searchText: searchBar.text ?? "Spider")
        charactersView?.collectionView.reloadData()
    }
    
   
}
