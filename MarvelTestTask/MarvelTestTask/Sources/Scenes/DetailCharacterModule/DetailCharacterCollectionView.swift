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
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .black
        return collectionView
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
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func setupCompositionalLayout() -> UICollectionViewLayout {
        let spacing: CGFloat = 5
        
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(150))
        let headerElement = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        headerElement.pinToVisibleBounds = true
        
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 5, bottom: 0, trailing: 10)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(0.1))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: item, count: 1)
        let section = NSCollectionLayoutSection(group: group)
        
        section.orthogonalScrollingBehavior = .groupPaging
        section.interGroupSpacing = spacing
        section.boundarySupplementaryItems = [headerElement]
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
}
