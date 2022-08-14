//
//  CustomCollectionViewCell.swift
//  MarvelTestTask
//
//  Created by Даниил Смирнов on 29.07.2022.
//

import UIKit
class CustomCollectionViewCell: UICollectionViewCell {
    //MARK: - properties
    static let reuseID = "CustomCollectionViewCell"
    
    //MARK: - views
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 15
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.backgroundColor = .black
        return imageView
    }()
    
    lazy var characterLabel: UILabel = {
        let characterLabel = UILabel()
        characterLabel.translatesAutoresizingMaskIntoConstraints = false
        characterLabel.font = .systemFont(ofSize: 17, weight: .medium)
        characterLabel.textColor = .white
        characterLabel.textAlignment = .center
        characterLabel.numberOfLines = 2
        characterLabel.backgroundColor = .black.withAlphaComponent(0.6)
        return characterLabel
    }()
    
    lazy var activityIndicatorView: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView(style: .medium)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.color = .systemGray
        view.hidesWhenStopped = true
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

extension CustomCollectionViewCell {
    
    //MARK: - Private methods
    private func setupHierarchy() {
        contentView.addSubview(imageView)
        imageView.addSubview(characterLabel)
        imageView.addSubview(activityIndicatorView)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            activityIndicatorView.centerXAnchor.constraint(equalTo: imageView.centerXAnchor),
            activityIndicatorView.centerYAnchor.constraint(equalTo: imageView.centerYAnchor),
            
            characterLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor),
            characterLabel.trailingAnchor.constraint(equalTo: imageView.trailingAnchor),
            characterLabel.bottomAnchor.constraint(equalTo: imageView.bottomAnchor)            
        ])
    }
}
