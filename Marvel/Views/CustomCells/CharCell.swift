//
//  CharCell.swift
//  Marvel
//
//  Created by Ivan Valero on 14/07/2022.
//

import UIKit
import Kingfisher

class CharCell: UITableViewCell {
    
    static let kIdentifier = "CharCell"
    
    @IBOutlet weak var charImage: UIImageView!
    @IBOutlet weak var charName: UILabel!
    @IBOutlet weak var charDescription: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        configView()

    }
    
    
    func configView() {
        selectionStyle = .none
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = .zero
        layer.cornerRadius = 20
        layer.shadowOpacity = 0.1
        
    }
    
    func setData(model: CharacterModel.DataClass.Result) {
        if let imageUrl = model.thumbnail.path?.asUrl, let extensionImage = model.thumbnail.thumbnailExtension, let url2 = URL(string: "\(imageUrl)" + ".\(extensionImage)"){
            charImage.kf.indicatorType = .activity
            charImage.kf.setImage(with: url2)
        }
        charName.text = model.name
        charDescription.text = model.resultDescription ?? "Descriptionn"
    }
}
