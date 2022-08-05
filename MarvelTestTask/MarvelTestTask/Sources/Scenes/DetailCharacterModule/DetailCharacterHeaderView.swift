//
//  DetailCharacterHeaderView.swift
//  MarvelTestTask
//
//  Created by Даниил Смирнов on 29.07.2022.
//

import UIKit

class DetailCharacterHeaderView: UICollectionReusableView {
    //MARK: - Properties
    static let reuseID = "DetailCharacterHeaderView"
    //MARK: - Views
    private lazy var verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 5
        stackView.distribution = .fill
        stackView.backgroundColor = .black
        return stackView
    }()
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 8
        return imageView
    }()
    
    private lazy var nameTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Name"
        label.font = .systemFont(ofSize: 17, weight: .regular)
        label.textColor = .red
        label.textAlignment = .left
        return label
    }()
    
    lazy var nameDataLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .regular)
        label.textColor = .systemGray
        label.textAlignment = .left
        return label
    }()
    
    private lazy var descriptionTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Description"
        label.font = .systemFont(ofSize: 17, weight: .regular)
        label.textColor = .red
        label.textAlignment = .left
        return label
    }()
    
    lazy var descriptionDataLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.font = .systemFont(ofSize: 15, weight: .regular)
        label.textColor = .systemGray
        label.textAlignment = .left
        return label
    }()
    
    lazy var contentTypeLabel: UILabel = {
        let label = UILabel()
        label.text = "Comics"
        label.font = .systemFont(ofSize: 17, weight: .regular)
        label.numberOfLines = 0
        label.textColor = .red
        label.textAlignment = .left
        return label
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

extension DetailCharacterHeaderView {
    
    //MARK: - Setup Methods
    private func setupHierarchy() {
        addSubview(imageView)
        addSubview(verticalStackView)
        verticalStackView.addArrangedSubview(nameTitleLabel)
        verticalStackView.addArrangedSubview(nameDataLabel)
        verticalStackView.addArrangedSubview(descriptionTitleLabel)
        verticalStackView.addArrangedSubview(descriptionDataLabel)
        verticalStackView.addArrangedSubview(contentTypeLabel)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 170),
            
            verticalStackView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 5),
            verticalStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            verticalStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
    
}
