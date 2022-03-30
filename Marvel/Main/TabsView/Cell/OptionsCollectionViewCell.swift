//
//  OptionsCollectionViewCell.swift
//  Marvel
//
//  Created by Ivan Valero on 29/03/2022.
//

import UIKit

class OptionsCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var titleTabsLabel: UILabel!
    
    static let kIdOptions = "OptionsCollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setupCell(option: String) {
        titleTabsLabel.text = option
    }
}
