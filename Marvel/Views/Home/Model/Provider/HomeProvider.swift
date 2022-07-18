//
//  HomeProvider.swift
//  Marvel
//
//  Created by Ivan Valero on 14/06/2022.
//

import Foundation

protocol HomeProviderProtocol {
    func getCharacters() async throws -> CharacterModel
    func getEvents() async throws -> EventsModel
    func getCharactersDetails(_ charId: String) async throws -> CharacterModel
    func getEventsDetails(_ eventsId: String) async throws -> EventsModel
}

class HomeProvider: HomeProviderProtocol {
    func getCharacters() async throws -> CharacterModel{

        let requestModel = RequestModel(endpoint: .character, route: .noneId)
        
        do{
            let model = try await ServiceLayer.callService(requestModel, CharacterModel.self)
            return model
        }catch {
            print(error)
            throw error
        }
    }
    func getEvents() async throws -> EventsModel{

        let requestModel = RequestModel(endpoint: .events, route: .noneId)
        
        do{
            let modelEvents = try await ServiceLayer.callService(requestModel, EventsModel.self)
            return modelEvents
        }catch {
            print(error)
            throw error
        }
    }
    func getCharactersDetails(_ charId: String) async throws -> CharacterModel{
        let requestModel = RequestModel(endpoint: .character, route: .details(charId))
        
        do{
            let model = try await ServiceLayer.callService(requestModel, CharacterModel.self)
            return model
        }catch {
            print(error)
            throw error
        }
    }
    func getEventsDetails(_ eventsId: String) async throws -> EventsModel{
        let requestModel = RequestModel(endpoint: .events, route: .details(eventsId))
        
        do{
            let model = try await ServiceLayer.callService(requestModel, EventsModel.self)
            return model
        }catch {
            print(error)
            throw error
        }
    }
}
