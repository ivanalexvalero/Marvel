//
//  EventsCell.swift
//  Marvel
//
//  Created by Ivan Valero on 15/06/2022.
//

import UIKit
import Kingfisher

class EventsCell: UITableViewCell {

    @IBOutlet weak var eventsImage: UIImageView!
    @IBOutlet weak var eventsNameLabel: UILabel!
    @IBOutlet weak var eventsDateLabel: UILabel!
    
    static let kIdentifier = "EventsCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()

        configViewCell()
    }
    
    func configViewCell() {
        selectionStyle = .none
    }

    func setData(model: EventsModel.DataClass.Result) {
        if let imageUrl = model.thumbnail.path, let extensionImage = model.thumbnail.thumbnailExtension, let url = URL(string: "\(imageUrl)" + ".\(extensionImage)") {
            eventsImage.kf.setImage(with: url)
            eventsImage.kf.indicatorType = .activity
        }
        eventsNameLabel.text = model.title
        let dateEvents = model.modified ?? "1"
        eventsDateLabel.text = toString(dateModel: dateEvents)
   
    }

}

