//
//  CharacterDetailProvider.swift
//  Marvel
//
//  Created by Ivan Valero on 04/07/2022.
//
//
//import Foundation
//
//protocol DetailProtocol{
//    func getCharactersDetails(_ charId: String) async throws -> CharacterModel
//}
//
//class CharacterDetailProvider: DetailProtocol{
//    func getCharactersDetails(_ charId: String) async throws -> CharacterModel{
//        let requestModel = RequestModel(endpoint: .character, route: .details(charId))
//        
//        do{
//            let model = try await ServiceLayer.callService(requestModel, CharacterModel.self)
//            return model
//        }catch {
//            print(error)
//            throw error
//        }
//    }
//}
