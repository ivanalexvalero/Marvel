//
//  EventsViewController.swift
//  Marvel
//
//  Created by Ivan Valero on 13/06/2022.
//

import UIKit

class EventsViewController: UIViewController {

    @IBOutlet weak var tableViewEvents: UITableView!
    private var objectEventsList: [[Any]] = []
    lazy var presenter = HomePresenter(delegate: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configTableView()
        
        Task {
            await presenter.getListEvents()
        }
        
    }
    
    
    func configTableView() {
        tableViewEvents.register(UINib(nibName: EventsCell.kIdentifier, bundle: nil), forCellReuseIdentifier: EventsCell.kIdentifier)
        tableViewEvents.reloadData()
        tableViewEvents.separatorColor = .clear
        
        tableViewEvents.delegate = self
        tableViewEvents.dataSource = self
    }


}

extension EventsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objectEventsList[section].count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return objectEventsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = objectEventsList[indexPath.section]
        if let events = data as? [EventsModel.DataClass.Result]{
            guard let cell = tableView.dequeueReusableCell(withIdentifier: EventsCell.kIdentifier, for: indexPath) as? EventsCell else {
                return UITableViewCell()
            }
            
            cell.setData(model: events[indexPath.row])
            
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = objectEventsList[indexPath.section]
        let eventsId: Int
        let imageEvents: String
        let nameEvents: String
        let startEvents: String
        let modifiedEvents: String
        
        if let eventsDetail = item as? [EventsModel.DataClass.Result] {
            eventsId = eventsDetail[indexPath.row].id ?? 0
            nameEvents = eventsDetail[indexPath.row].title ?? ""
            imageEvents = eventsDetail[indexPath.row].thumbnail.path ?? ""
            startEvents = eventsDetail[indexPath.row].start ?? ""
            modifiedEvents = eventsDetail[indexPath.row].modified ?? ""
            
            let vc = EventsDetailsViewController(eventsId: "\(eventsId)", imageEvents: imageEvents, nameEvents: nameEvents, startEvents: startEvents, modifiedEvents: modifiedEvents)
            
            navigationController?.present(vc, animated: true)
            
        }
    }
}

extension EventsViewController: HomeViewProtocol {
    func getData(list: [[Any]]) {
        objectEventsList = list
        tableViewEvents.reloadData()
//        print("list events: ", list)
    }
}
