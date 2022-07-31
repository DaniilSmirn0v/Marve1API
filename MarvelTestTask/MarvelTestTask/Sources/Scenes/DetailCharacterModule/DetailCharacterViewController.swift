//
//  DetailCharacterViewController.swift
//  MarvelTestTask
//
//  Created by Даниил Смирнов on 29.07.2022.
//

import UIKit

class DetailCharacterViewController: UIViewController {
    
    //MARK: - Properties
    private var detailCharacterTableView: DetailCharacterTableView? {
        guard isViewLoaded else { return nil }
        return view as? DetailCharacterTableView
    }
    
    //MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    //MARK: - Settings
    private func setupView() {
        view = DetailCharacterTableView()
        title = "Name"
        detailCharacterTableView?.tableView.delegate = self
        detailCharacterTableView?.tableView.dataSource = self        
    }
}

extension DetailCharacterViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ContentTableViewCell.reuseID, for: indexPath)
                as? ContentTableViewCell else { return UITableViewCell()}
       
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: DetailCharacterHeaderView.reuseID)
                as? DetailCharacterHeaderView else { return DetailCharacterHeaderView() }
        header.contentView.backgroundColor = .black
        return header
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        150
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        300
    }
    
}


extension DetailCharacterViewController: UITableViewDelegate {
    
}
