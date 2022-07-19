//
//  ComicsListTableViewCell.swift
//  Marvel
//
//  Created by Ivan Valero on 29/06/2022.
//

import UIKit

class ComicsListCell: UITableViewCell {

    static let kId = "ComicsListCell"
    
    @IBOutlet weak var comicName: UILabel!
    @IBOutlet weak var comicYear: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    func configCell(model: CharacterModel.DataClass.Result) {
        comicName.text = model.comics.items.first?.name

    }
   
    func configCellEvents(items: EventsModel.DataClass.Result){
        comicName.text = items.comics.items.first?.name
    }
    
}
