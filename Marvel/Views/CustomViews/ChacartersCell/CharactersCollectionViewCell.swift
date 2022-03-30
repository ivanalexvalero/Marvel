//
//  CharactersCollectionViewCell.swift
//  Marvel
//
//  Created by Ivan Valero on 29/03/2022.
//

import UIKit
import Kingfisher

class CharactersCollectionViewCell: UICollectionViewCell {
    
    static let kId = "CharactersCollectionViewCell"

    @IBOutlet weak var charactersImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    func setup(model: Result) {
        titleLabel.text =  model.name
        descriptionLabel.text = model.comics.items.first?.name
        charactersImageView.kf.setImage(with: model.resourceURI.asUrl)
    }
    

}
