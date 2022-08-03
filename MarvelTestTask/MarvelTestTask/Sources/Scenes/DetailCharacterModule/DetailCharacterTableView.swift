//
//  DetailCharacterTableView.swift
//  MarvelTestTask
//
//  Created by Даниил Смирнов on 30.07.2022.
//

import UIKit

class DetailCharacterTableView: UIView {
    //MARK: - Views
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .none
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(ContentTableViewCell.self, forCellReuseIdentifier: ContentTableViewCell.reuseID)
        tableView.register(DetailCharacterHeaderView.self, forHeaderFooterViewReuseIdentifier: DetailCharacterHeaderView.reuseID)
        return tableView
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

extension DetailCharacterTableView {
    private func setupHierarchy() {
        addSubview(tableView)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
