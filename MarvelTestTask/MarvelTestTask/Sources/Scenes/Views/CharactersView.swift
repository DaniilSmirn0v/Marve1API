//
//  CharactersView.swift
//  MarvelTestTask
//
//  Created by Даниил Смирнов on 29.07.2022.
//

import UIKit

class CharactersView: UIView {
    
    //MARK: - Views
    
     lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: createCompositionalLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.backgroundColor = .black
        collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: CustomCollectionViewCell.reuseID)
        return collectionView
    }()
    
    lazy var activityIndicatorView: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView(style: .medium)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.color = .systemGray
        view.hidesWhenStopped = true
        return view
    }()
    
    lazy var blackBlureView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        view.isHidden = false
        return view
    }()
    
    //MARK: - Initialize
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CharactersView {
    
    //MARK: - Private func
    private func createCompositionalLayout() -> UICollectionViewLayout {
        let spacing: CGFloat = 10
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
       
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.2))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = spacing
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
    
    private func setupHierarchy() {
        addSubview(collectionView)
        addSubview(blackBlureView)
        addSubview(activityIndicatorView)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            blackBlureView.leadingAnchor.constraint(equalTo: leadingAnchor),
            blackBlureView.topAnchor.constraint(equalTo: topAnchor),
            blackBlureView.trailingAnchor.constraint(equalTo: trailingAnchor),
            blackBlureView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            activityIndicatorView.centerXAnchor.constraint(equalTo: centerXAnchor),
            activityIndicatorView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
