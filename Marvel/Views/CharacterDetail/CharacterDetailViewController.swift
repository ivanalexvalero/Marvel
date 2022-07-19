//
//  CharacterDetailViewController.swift
//  Marvel
//
//  Created by Ivan Valero on 29/06/2022.
//

import UIKit
import Kingfisher

class CharacterDetailViewController: UIViewController {
    
    @IBOutlet weak var detailImage: UIImageView!
    @IBOutlet weak var descriptionDetailLabel: UILabel!
    @IBOutlet weak var titleListLevel: UILabel!
    
    @IBOutlet weak var tableViewComics: UITableView!
    @IBOutlet weak var nameComics: UILabel!
    
    private var objectList2: [[Any]] = []
    lazy var presenter = HomePresenter(delegate: self)
    
    var charModel: CharacterModel.DataClass.Result?

    private var charId: String = ""
    private var imageData: String = ""
    private var descriptionData: String = ""
    private var extensionImage: String = ""
<<<<<<< HEAD
=======
//    private var items: String = ""
>>>>>>> firstTests
    private var name: String = ""
    
    init(charId: String, imageData: String, descriptionData: String, extensionImage: String, name: String) {
        super.init(nibName: nil, bundle: nil)
        self.charId = charId
        self.imageData = imageData
        self.descriptionData = descriptionData
        self.extensionImage = extensionImage
<<<<<<< HEAD
=======
//        self.items = items
>>>>>>> firstTests
        self.name = name
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadData()
        configTableViewDetails()
        setDetailsData()
        
        title = name
    }
    
    private func loadData(){
        Task{ [weak self] in
            await self?.presenter.getDetailData(charId: charId)
<<<<<<< HEAD
=======
            
>>>>>>> firstTests
        }
    }
    
    func configTableViewDetails() {
<<<<<<< HEAD
=======
//        tableViewComics.register(ComicsListCell.self, forCellReuseIdentifier: ComicsListCell.kId)
>>>>>>> firstTests
        tableViewComics.register(UINib(nibName: ComicsListCell.kId, bundle: nil), forCellReuseIdentifier: ComicsListCell.kId)
        
        tableViewComics.delegate = self
        tableViewComics.dataSource = self
        tableViewComics.reloadData()
    }


    func setDetailsData(){
        if let url = URL(string: "\(imageData)" + ".\(extensionImage)") {
            detailImage.kf.setImage(with: url)
        }
        descriptionDetailLabel.text = descriptionData
//        nameComics.text = charModel?.name
        titleListLevel.text = "Lista de Comics"
    }

}

extension CharacterDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return presenter.listDetails.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.listDetails[section].count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = presenter.listDetails[indexPath.section]
        if let charDetail = data as? [CharacterModel.DataClass.Result]{
            guard let detailCell = tableView.dequeueReusableCell(withIdentifier: ComicsListCell.kId, for: indexPath) as? ComicsListCell else {
                return UITableViewCell()
            }
            
            detailCell.configCell(model: charDetail[indexPath.row])
            
<<<<<<< HEAD
=======
            
>>>>>>> firstTests
            return detailCell

        }
        return UITableViewCell()

    }

}


extension CharacterDetailViewController: HomeViewProtocol {
    func getData(list: [[Any]]) {
        print("List Details: ", list)
        presenter.listDetails = list
        tableViewComics.reloadData()
    }
    
}
