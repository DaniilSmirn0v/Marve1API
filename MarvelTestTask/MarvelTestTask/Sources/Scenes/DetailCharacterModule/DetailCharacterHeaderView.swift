//
//  DetailCharacterHeaderView.swift
//  MarvelTestTask
//
//  Created by Даниил Смирнов on 29.07.2022.
//

import UIKit

class DetailCharacterHeaderView: UITableViewHeaderFooterView {
    //MARK: - Properties
    static let reuseID = "DetailCharacterHeaderView"
    //MARK: - Views
    private lazy var verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.distribution = .fill
        return stackView
    }()
    
     lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
         imageView.clipsToBounds = true
        imageView.backgroundColor = .systemYellow
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
        label.text = "Random Name"
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
        label.text = "ОченьМногоТекстаОченьМногоТекстаОченьМногоТекстаОченьМногоТекстаОченьМногоТекстаОченьМногоТекстаОченьМногоТекстаОченьМногоТекстаОченьМногоТекстаОченьМногоТекстаОченьМногоТекстаОченьМногоТекстаОченьМногоТекстаОченьМногоТекстаОченьМногоТекстаОченьМногоТекстаОченьМногоТекстаОченьМногоТекстаОченьМногоТекстаОченьМногоТекстаОченьМногоТекстаОченьМногоТекста"
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.font = .systemFont(ofSize: 15, weight: .regular)
        label.textColor = .systemGray
        label.textAlignment = .left
        return label
    }()
    
    
    //MARK: - Initialize
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
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
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 200),
            imageView.widthAnchor.constraint(equalTo: widthAnchor),
            
            verticalStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            verticalStackView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10),
            verticalStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            verticalStackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        
        ])
    }
    
}
