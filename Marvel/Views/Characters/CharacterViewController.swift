//
//  CharacterViewController.swift
//  Marvel
//
//  Created by Ivan Valero on 13/06/2022.
//

import UIKit

class CharacterViewController: UIViewController {
    
    @IBOutlet weak var tableViewCharacter: UITableView!
    private var objectList2: [[Any]] = []
    lazy var presenter = HomePresenter(delegate: self)

    
    override func viewDidLoad() {
        super.viewDidLoad()

        configTableView()
        
        Task {
            await presenter.getListData()
        }
        
    }
    
    func configTableView(){

        tableViewCharacter.register(UINib(nibName: CharCell.kIdentifier, bundle: nil), forCellReuseIdentifier: CharCell.kIdentifier)
        tableViewCharacter.reloadData()
        
        tableViewCharacter.delegate = self
        tableViewCharacter.dataSource = self
        
    }


}

extension CharacterViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objectList2[section].count

    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return objectList2.count
    }
   

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = objectList2[indexPath.section]
        if let character = data as? [CharacterModel.DataClass.Result] {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CharCell.kIdentifier, for: indexPath) as? CharCell else {
            return UITableViewCell()
        }
        cell.setData(model: character[indexPath.row])
        return cell
        }
        return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = objectList2[indexPath.section]
        let characterData: Int
        let imageData: String
        let descriptionData: String
        let extensionImage: String
        let name: String
        if let character = item as? [CharacterModel.DataClass.Result] {
            characterData = character[indexPath.row].id ?? 0
            imageData = character[indexPath.row].thumbnail.path ?? ""
            descriptionData = character[indexPath.row].resultDescription ?? "Descripción"
            extensionImage = character[indexPath.row].thumbnail.thumbnailExtension?.rawValue ?? ""
            name = character[indexPath.row].name ?? ""
            
            let vc = CharacterDetailViewController(charId: "\(characterData)", imageData: imageData, descriptionData: descriptionData, extensionImage: extensionImage, name: name)
            
            
//            present(vc, animated: true)
            navigationController?.pushViewController(vc, animated: true)
        }
        
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90.0
    }

}

extension CharacterViewController: HomeViewProtocol {
    func getData(list: [[Any]]) {
        objectList2 = list
        
        tableViewCharacter.reloadData()
//        print("list: ", list)
    }
}

