//
//  CharacterModel.swift
//  Marvel
//
//  Created by Ivan Valero on 14/06/2022.
//

import Foundation


// MARK: - CharacterModel
struct CharacterModel: Decodable {
    let code: Int
    let status: String
    let copyright: String
    let attributionText: String
    let attributionHTML: String
    let etag: String
    let data: DataClass
    
    enum CodingKeys: String, CodingKey {
        case code
        case status
        case copyright
        case attributionText
        case attributionHTML
        case etag
        case data
    }
    
    
    
    // MARK: - DataClass
    struct DataClass: Decodable {
        let total: Int?
        let count: Int?
        let results: [DataClass.Result]
        
        enum CodingKeys: String, CodingKey {
            case total
            case count
            case results
        }
        
        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)

            if let total = try? container.decode(Int.self, forKey: .total){
                self.total = total
            }else {
                self.total = nil
            }

            if let count = try? container.decode(Int.self, forKey: .count){
                self.count = count
            }else {
                self.count = nil
            }

            self.results = try container.decode([DataClass.Result].self, forKey: .results)
        }
        
        // MARK: - Result
        struct Result: Decodable {
            var id: Int?
            let name: String?
            let resultDescription: String?
            let thumbnail: Thumbnail
            let modified: Date?
//            let resourceURI: String?
            let comics: Comics
//            let series: Comics?
//            let stories: Stories?
//            let events: Comics?
//            let urls: URLElement?

            enum CodingKeys: String, CodingKey {
                case id
                case name
                case resultDescription = "description"
                case thumbnail
                case modified
//                case resourceURI
                case comics
//                case series
//                case stories
//                case events
//                case urls
            }
            
            init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: CodingKeys.self)
                
                if let id = try? container.decode(Int.self, forKey: .id){
                    self.id = id
                }else {
                    self.id = nil
                }
                if let name = try? container.decode(String.self, forKey: .name){
                    self.name = name
                }else {
                    self.name = nil
                }
                if let resultDescription = try? container.decode(String.self, forKey: .resultDescription){
                    self.resultDescription = resultDescription
                }else {
                    self.resultDescription = nil
                }
                self.thumbnail = try container.decode(Thumbnail.self, forKey: .thumbnail)
                
                if let modified = try? container.decode(Date.self, forKey: .modified){
                    self.modified = modified
                }else {
                    self.modified = nil
                }
<<<<<<< HEAD

                self.comics = try container.decode(Comics.self, forKey: .comics)

=======
                
//                if let resourceURI = try? container.decode(String.self, forKey: .resourceURI){
//                    self.resourceURI = resourceURI
//                }else {
//                    self.resourceURI = nil
//                }
                self.comics = try container.decode(Comics.self, forKey: .comics)
                
                
//                if let series = try? container.decode(Comics.self, forKey: .series){
//                    self.series = series
//                }else {
//                    self.series = nil
//                }
//                if let stories = try? container.decode(Stories.self, forKey: .stories){
//                    self.stories = stories
//                }else {
//                    self.stories = nil
//                }
//                if let events = try? container.decode(Comics.self, forKey: .events){
//                    self.events = events
//                }else {
//                    self.events = nil
//                }
//                if let urls = try? container.decode(URLElement.self, forKey: .urls){
//                    self.urls = urls
//                }else {
//                    self.urls = nil
//                }
>>>>>>> firstTests
           
            }
            
            
            // MARK: - Comics
            struct Comics: Decodable {
//                let available: Int?
//                let collectionURI: String?
                let items: [ComicsItem]
//                let returned: Int?
                enum CodingKeys: String, CodingKey {
                    case items
                }
                
                
                init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: CodingKeys.self)
                       
                    self.items = try container.decode([ComicsItem].self, forKey: .items)
            
                }
                // MARK: - ComicsItem
                struct ComicsItem: Decodable {
                    let resourceURI: String
                    let name: String
                    
                    enum CodingKeys: String, CodingKey {
                        case name
                        case resourceURI
         
                    }
                    
                        init(from decoder: Decoder) throws {
                            let container = try decoder.container(keyedBy: CodingKeys.self)
    
                            self.name = try container.decode(String.self, forKey: .name)
    
                            self.resourceURI = try container.decode(String.self, forKey: .resourceURI)
    
                        }
                    
                    
                }

                
            }// Comics

            


//            // MARK: - Stories
//            struct Stories: Decodable {
//                let available: Int?
//                let collectionURI: String?
//                let items: [StoriesItem]?
//                let returned: Int?
//
//                // MARK: - StoriesItem
//                struct StoriesItem: Decodable {
//                    let resourceURI: String?
//                    let name: String?
//                    let type: ItemType?
//
//                    enum ItemType: String, Decodable {
//                        case cover = "cover"
//                        case empty = ""
//                        case interiorStory = "interiorStory"
//                    }
//                }
//            }//Stories


            // MARK: - Thumbnail
            struct Thumbnail: Decodable {
                let path: String?
                let thumbnailExtension: Extension?

                enum CodingKeys: String, CodingKey {
                    case path
                    case thumbnailExtension = "extension"
                }
                enum Extension: String, Decodable {
                    case gif = "gif"
                    case jpg = "jpg"
                }
                
                init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: CodingKeys.self)
                    if let path = try? container.decode(String.self, forKey: .path){
                        self.path = path
                    }else {
                        self.path = nil
                    }
                    if let thumbnailExtension = try? container.decode(Extension.self, forKey: .thumbnailExtension){
                        self.thumbnailExtension = thumbnailExtension
                    }else {
                        self.thumbnailExtension = nil
                    }
                }
            }//Thumbnail

//            // MARK: - URLElement
//            struct URLElement: Decodable {
//                let type: URLType?
//                let url: String?
//
//                enum URLType: String, Decodable {
//                    case comiclink = "comiclink"
//                    case detail = "detail"
//                    case wiki = "wiki"
//                }
//            }//URLElement

        }//Result
        
    }
    
    
}












