//
//  CharactersViewController.swift
//  MarvelTestTask
//
//  Created by Даниил Смирнов on 29.07.2022.
//

import Foundation
import UIKit

class CharactersViewController: UIViewController {
    
    //MARK: - Properties
    
    private var charactersView: CharactersView? {
        guard isViewLoaded else { return nil }
        return view as? CharactersView
    }
    
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
        charactersView?.collectionView.delegate = self
        charactersView?.collectionView.dataSource = self
    }
    
    
    
}

extension CharactersViewController: UICollectionViewDelegate {
    
}

extension CharactersViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }

    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.reuseID, for: indexPath)
                        as? CustomCollectionViewCell else { return CustomCollectionViewCell() }
        
        cell.characterLabel.text = "123123123"
//        cell.imageView.image = UIImage(named: "test1")
        return cell
    }
    
    
}
