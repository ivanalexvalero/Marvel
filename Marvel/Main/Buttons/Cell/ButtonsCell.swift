//
//  ButtonsCell.swift
//  Marvel
//
//  Created by Ivan Valero on 15/07/2022.
//

import UIKit

class ButtonsCell: UICollectionViewCell {
    
    static let kIdButtons = "ButtonsCell"
    override var isSelected: Bool {
        didSet{
            highLightText(isSelected ? .black : .gray)
            imageColor(isSelected ? .black : .gray)
            
        }
    }

    @IBOutlet weak var imageButtons: UIImageView!
    
    @IBOutlet weak var nameButtons: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
        func configButtonCell(option: buttonsModel) {
            nameButtons.text = option.name
            imageButtons.image = option.image1
        }
    
    func highLightText(_ color: UIColor) {
        nameButtons.textColor = color
    }
    func imageColor(_ color: UIColor) {
        imageButtons.tintColor = color
    }

}
