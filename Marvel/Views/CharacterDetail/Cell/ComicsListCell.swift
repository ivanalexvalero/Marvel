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
//        let cell = items.comics.items.map({$0.name})
//        for value in model.comics.items {
//            comicName.text = value.name
//            print("Valores: ",value)
//        }
        comicName.text = model.comics.items.first?.name
//        comicName.text = array.map($0.name)
//        print(comicName.text)
    }
   
    func configCellEvents(items: EventsModel.DataClass.Result){
        comicName.text = items.comics.items.first?.name
    }
    
}
