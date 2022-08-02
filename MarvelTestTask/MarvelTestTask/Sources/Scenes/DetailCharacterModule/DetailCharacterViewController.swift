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
    
    var presenter: DetailCharactersPresenterProtocol?
    var hero: Hero?
    
    //MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupNavigationController()
    }
    
    //MARK: - Settings
    private func setupView() {
        view = DetailCharacterTableView()
        presenter?.setChar()
        detailCharacterTableView?.tableView.delegate = self
        detailCharacterTableView?.tableView.dataSource = self        
    }
    
    private func setupNavigationController() {
        title = hero?.name
    }
}


//MARK: - UITableViewDataSource
extension DetailCharacterViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
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
        let urlString = hero?.thumbnail.url ?? ""
        header.nameDataLabel.text = hero?.name
        
            
        header.descriptionDataLabel.text = hero?.resultDescription.description != ""
                                        ? hero?.resultDescription.description
                                        : "Glorious description is missing!:>"

        DispatchQueue.main.async {
            header.imageView.download(image: urlString)
        }
        return header
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        150
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        250
    }
    
}

//MARK: - UITableViewDelegate
extension DetailCharacterViewController: UITableViewDelegate {
    
}


//MARK: - DetailCharactersViewProtocol

extension DetailCharacterViewController: DetailCharactersViewProtocol {
    func setCharacter(data: Hero?) {
        hero = data
    }
    
    func success() {
        detailCharacterTableView?.tableView.reloadData()
    }
    
    
    
    
}
