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
//    var model : [CharacterModel] = []
    lazy var presenter = HomePresenter(delegate: self)
//    let cellSpacingHeight: CGFloat = 10.0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configTableView()
        
        Task {
            await presenter.getListData()
        }
        
    }
    
    func configTableView(){
//        let nibCharacter = UINib(nibName: "\(CharacterCell.self)", bundle: nil)
        tableViewCharacter.register(UINib(nibName: CharCell.kIdentifier, bundle: nil), forCellReuseIdentifier: CharCell.kIdentifier)
        tableViewCharacter.reloadData()
        
        tableViewCharacter.delegate = self
        tableViewCharacter.dataSource = self
        
//        tableViewCharacter.separatorColor = .clear
//        tableViewCharacter.contentInset = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
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
//        let items: String
        let name: String
        if let character = item as? [CharacterModel.DataClass.Result] {
            characterData = character[indexPath.row].id ?? 0
            imageData = character[indexPath.row].thumbnail.path ?? ""
            descriptionData = character[indexPath.row].resultDescription ?? "Descripción"
            extensionImage = character[indexPath.row].thumbnail.thumbnailExtension?.rawValue ?? ""
//            items = character[indexPath.row].comics.items.first?.name ?? ""
            name = character[indexPath.row].name ?? ""
            
            let vc = CharacterDetailViewController(charId: "\(characterData)", imageData: imageData, descriptionData: descriptionData, extensionImage: extensionImage, name: name)
            
            
//            present(vc, animated: true)
            navigationController?.pushViewController(vc, animated: true)
        }
        
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90.0
    }
//
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let headerView = UIView()
//        headerView.backgroundColor = view.backgroundColor
//        return headerView
//    }
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return cellSpacingHeight
//    }

}

extension CharacterViewController: HomeViewProtocol {
    func getData(list: [[Any]]) {
        objectList2 = list
        
        tableViewCharacter.reloadData()
//        print("list: ", list)
    }
}

