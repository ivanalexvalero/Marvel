//
//  EventsDetailsViewController.swift
//  Marvel
//
//  Created by Ivan Valero on 07/07/2022.
//

import UIKit
import Kingfisher

class EventsDetailsViewController: UIViewController {
    @IBOutlet weak var imageEventsDetails: UIImageView!
    @IBOutlet weak var nameEventsDetails: UILabel!
    @IBOutlet weak var dateEventsDetails: UILabel!
    @IBOutlet weak var tableViewEventsDetails: UITableView!
    @IBOutlet weak var titleEventsDetails: UILabel!
    
    
    lazy var presenter = HomePresenter(delegate: self)
    private var eventsId: String = ""
    private var imageEvents: String = ""
    private var nameEvents: String = ""
    private var startEvents: String = ""
    private var modifiedEvents: String = ""
    
    
    init(eventsId: String, imageEvents: String, nameEvents: String, startEvents: String, modifiedEvents: String) {
        super.init(nibName: nil, bundle: nil)
        self.eventsId = eventsId
        self.imageEvents = imageEvents
        self.nameEvents = nameEvents
        self.startEvents = startEvents
        self.modifiedEvents = modifiedEvents
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadData()
        configView()
        configTableView()
        
    }
    
    private func loadData(){
        Task{ [weak self] in
            await self?.presenter.getDetailEventsData(eventsId: eventsId)
            
        }
    }

    func configView() {

        if let url = URL(string: "\(imageEvents)" + ".jpg") {
            imageEventsDetails.kf.setImage(with: url)
        }
        nameEventsDetails.text = nameEvents
        titleEventsDetails.text = "Cómics para discutir"
        dateEventsDetails.text = toString(dateModel: modifiedEvents)
        
//        let dateEvents = startEvents
//        
//        let dateFormatter = DateFormatter()
//        dateFormatter.locale = Locale(identifier: "es_US")
//        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
//        guard let dateNew = dateFormatter.date(from: dateEvents) ?? nil else { return  }
//        let calendar = Calendar.current
//        let components = calendar.dateComponents([.year], from: dateNew)
//        print("fecha: ", components)
//        dateEventsDetails.text = "\(components)"
    }
    
    func configTableView() {
        tableViewEventsDetails.register(UINib(nibName: ComicsListCell.kId, bundle: nil), forCellReuseIdentifier: ComicsListCell.kId)
        
        tableViewEventsDetails.dataSource = self
        tableViewEventsDetails.delegate = self
        tableViewEventsDetails.reloadData()
    }
    

}


extension EventsDetailsViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return presenter.listDetails.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.listDetails[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = presenter.listDetails[indexPath.section]
        if let eventsDet = data as? [EventsModel.DataClass.Result] {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ComicsListCell.kId, for: indexPath) as? ComicsListCell else {
                
                return UITableViewCell()
            }
            
            cell.configCellEvents(items: eventsDet[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
    
    
}

extension EventsDetailsViewController: HomeViewProtocol{
func getData(list: [[Any]]) {
    presenter.listDetails = list
    print("EventsLst: ", list)
    
    tableViewEventsDetails.reloadData()
}
}
