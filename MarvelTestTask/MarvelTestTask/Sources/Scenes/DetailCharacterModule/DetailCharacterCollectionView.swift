//
//  DetailCharacterCollectionView.swift
//  MarvelTestTask
//
//  Created by Даниил Смирнов on 03.08.2022.
//

import UIKit

class DetailCharacterCollectionView: UIView {
    //MARK: - Views
    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: setupCompositionalLayout())
        collectionView.register(ContentCollectionCell.self, forCellWithReuseIdentifier: ContentCollectionCell.reuseID)
        collectionView.register(DetailCharacterHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: DetailCharacterHeaderView.reuseID)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.backgroundColor = .black
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

extension DetailCharacterCollectionView {
    
    //MARK: - Setup methods
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
    
    private func setupCompositionalLayout() -> UICollectionViewLayout {
        
        let mainHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.4))
        
        let mainHeaderElement = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: mainHeaderSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        mainHeaderElement.pinToVisibleBounds = true
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(0.4))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: item, count: 1)
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuousGroupLeadingBoundary
        section.boundarySupplementaryItems = [mainHeaderElement]
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
}
