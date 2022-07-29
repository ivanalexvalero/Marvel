//
//  HomePresenter.swift
//  Marvel
//
//  Created by Ivan Valero on 14/06/2022.
//

import Foundation

protocol HomeViewProtocol: AnyObject {
    func getData(list : [[Any]])
}

@MainActor class HomePresenter {
    
    var provider : HomeProviderProtocol
    weak var delegate: HomeViewProtocol?
    var objectList: [[Any]] = []
    var listDetails: [[Any]] = []
    
    init(delegate: HomeViewProtocol,provider: HomeProviderProtocol = HomeProvider()) {
        self.provider = provider
        self.delegate = delegate
    }
    
    
    func getListData() async {
        objectList.removeAll()
        
        
        do {
            let characters = try await provider.getCharacters().data.results
            
            objectList.append(characters)

            delegate?.getData(list: objectList)
        }catch {
            print(error)
        }
    }
    func getListEvents() async {
        objectList.removeAll()
        
        do {
            let events = try await provider.getEvents().data.results
            
            objectList.append(events)
            delegate?.getData(list: objectList)
            
        }catch {
            print(error)
        }
    }
    func getDetailData(charId: String) async{
        listDetails.removeAll()
        
        do{
            let detailCharacter = try await provider.getCharactersDetails(charId)
            
            listDetails.append(detailCharacter.data.results)
            delegate?.getData(list: listDetails)
            
        }catch {
            print(error)
        }
        
    }
    func getDetailEventsData(eventsId: String) async{
        listDetails.removeAll()
        
        do{
            let detailEvents = try await provider.getEventsDetails(eventsId)
            
            listDetails.append(detailEvents.data.results)
            delegate?.getData(list: listDetails)
            
        }catch {
            print(error)
        }
        
    }
}
