//
//  CharacterDetailPresenter.swift
//  Marvel
//
//  Created by Ivan Valero on 04/07/2022.
//

//import Foundation
//
//protocol CharacterViewProtocol: AnyObject{
//    func getDataNew(list : [[[Any]]])
//}
//
//@MainActor
//class CharacterDetailPresenter{
//    
//    var provider: DetailProtocol
//    weak var delegate: CharacterViewProtocol?
//    var detailObject: [[Any]] = []
//    var characterModel: CharacterModel.DataClass.Result?
//    var listDetailsNew: [[[Any]]] = []
//    
//    
//    
//    init(delegate: CharacterViewProtocol, provider: DetailProtocol = CharacterDetailProvider()) {
//        self.provider = provider
//        self.delegate = delegate
//    }
//    
//    func getDetailData(charId: String) async{
//        listDetailsNew.removeAll()
//        do{
//            let detailCharacter = try await provider.getCharactersDetails(charId)
//            
//            listDetailsNew.append(detailCharacter.data.results.first?.comics.first?.items.self ?? [])
//            delegate?.getDataNew(list: listDetailsNew)
//            
//        }catch {
//            print(error)
//        }
//        
//    }
//}


