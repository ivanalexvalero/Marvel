//
//  CharacterCell.swift
//  Marvel
//
//  Created by Ivan Valero on 15/06/2022.
//

//import UIKit
//import Kingfisher
//
//class CharacterCell: UITableViewCell {
//
//    @IBOutlet weak var characterImage: UIImageView!
//    @IBOutlet weak var nameCharacterLabel: UILabel!
//    @IBOutlet weak var descriptionCharacterLabel: UILabel!
//    @IBOutlet weak var characterView: UIView!
//    
//    static let kIdentifier = "CharacterCell"
//    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//        configView()
////        characterView.frame = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
////        characterImage.contentMode = ContentMode.scaleAspectFit
////        self.characterImage.image = imageChosen
//    }
//    
////    override func layoutSubviews() {
////        super.layoutSubviews()
////
////           contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
////    }
//    
//    func configView() {
//        selectionStyle = .none
//        layer.shadowColor = UIColor.black.cgColor
//        layer.shadowOffset = .zero
//        layer.cornerRadius = 20
//        layer.shadowOpacity = 0.1
//        
//    }
//    
//    func setData(model: CharacterModel.DataClass.Result) {
//        if let imageUrl = model.thumbnail.path?.asUrl, let extensionImage = model.thumbnail.thumbnailExtension, let url2 = URL(string: "\(imageUrl)" + ".\(extensionImage)"){
//            characterImage.kf.indicatorType = .activity
//            characterImage.kf.setImage(with: url2)
//
//        }
//
//        nameCharacterLabel.text = model.name
//        descriptionCharacterLabel.text = model.resultDescription ?? "Descripción"
//
//    }
//
//}
