//
//  EventsModel.swift
//  Marvel
//
//  Created by Ivan Valero on 27/06/2022.
//

import Foundation


// MARK: - Welcome
struct EventsModel: Decodable {
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
        let total: Int
        let count: Int
        let results: [DataClass.Result]
        
        enum CodingKeys: String, CodingKey {
            case total
            case count
            case results
        }
        
        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            
            self.total = try container.decode(Int.self, forKey: .total)
            self.count = try container.decode(Int.self, forKey: .count)
            self.results = try container.decode([DataClass.Result].self, forKey: .results)
        }
        
        // MARK: - Result
        struct Result: Decodable {
            let id: Int?
            let title: String?
            let resultDescription: String?
            let resourceURI: String?
            let urls: [URLElement]
            let modified: String?
            let start: String?
            let end: String?
            let thumbnail: Thumbnail
            let creators: Creators
            let characters: Characters
            let stories: Stories
            let comics: Characters
            let series: Characters
            let next: Next?
            let previous: Next?

            enum CodingKeys: String, CodingKey {
                case id
                case title
                case resultDescription = "description"
                case resourceURI
                case urls
                case modified
                case start
                case end
                case thumbnail
                case creators
                case characters
                case stories
                case comics
                case series
                case next
                case previous
                
            }
            
            init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: CodingKeys.self)
                
                if let id = try? container.decode(Int.self, forKey: .id){
                    self.id = id
                }else {
                    self.id = nil
                }
                if let title = try? container.decode(String.self, forKey: .title){
                    self.title = title
                }else {
                    self.title = nil
                }
                if let resultDescription = try? container.decode(String.self, forKey: .resultDescription){
                    self.resultDescription = resultDescription
                }else {
                    self.resultDescription = nil
                }
                if let resourceURI = try? container.decode(String.self, forKey: .resourceURI){
                    self.resourceURI = resourceURI
                }else {
                    self.resourceURI = nil
                }
                self.urls = try container.decode([URLElement].self, forKey: .urls)
                
                self.thumbnail = try container.decode(Thumbnail.self, forKey: .thumbnail)
                
                self.creators = try container.decode(Creators.self, forKey: .creators)
                
                if let modified = try? container.decode(String.self, forKey: .modified){
                    self.modified = modified
//                    modified.toString()
                }else {
                    self.modified = nil
                }
                
                if let start = try? container.decode(String.self, forKey: .start){
                    self.start = start
                }else {
                    self.start = nil
                }
                
                if let end = try? container.decode(String.self, forKey: .end){
                    self.end = end
                }else {
                    self.end = nil
                }
                self.characters = try container.decode(Characters.self, forKey: .characters)
                self.stories = try container.decode(Stories.self, forKey: .stories)
                self.comics = try container.decode(Characters.self, forKey: .comics)
                self.series = try container.decode(Characters.self, forKey: .series)
                
                if let next = try? container.decode(Next.self, forKey: .next){
                    self.next = next
                }else {
                    self.next = nil
                }
                
                if let previous = try? container.decode(Next.self, forKey: .previous){
                    self.previous = previous
                }else {
                    self.previous = nil
                }
 
            }
            
            // MARK: - Characters
            struct Characters: Decodable {
                let available: Int
                let collectionURI: String
                let items: [Next]
                let returned: Int
                
                enum CodingKeys: String, CodingKey {
                    case available
                    case collectionURI
                    case items
                    case returned
                }
                
                init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: CodingKeys.self)
                    self.available = try container.decode(Int.self, forKey: .available)
                    self.collectionURI = try container.decode(String.self, forKey: .collectionURI)
                    self.items = try container.decode([Next].self, forKey: .items)
                    self.returned = try container.decode(Int.self, forKey: .returned)
                }
               
            } // Characters

            // MARK: - Next
            struct Next: Decodable {
                let resourceURI: String
                let name: String
                
            enum CodingKeys: String, CodingKey {
                case resourceURI
                case name
            }
                
                init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: CodingKeys.self)

                    self.name = try container.decode(String.self, forKey: .name)

                    self.resourceURI = try container.decode(String.self, forKey: .resourceURI)

                }
            } //Next

            // MARK: - Creators
            struct Creators: Decodable {
                let available: Int
                let collectionURI: String
                let items: [CreatorsItem]
                let returned: Int
                
                // MARK: - CreatorsItem
                struct CreatorsItem: Decodable {
                    let resourceURI: String
                    let name: String
                    let role: Creators.Role
                }
                
                enum Role: String, Codable {
                    case artist = "artist"
                    case colorist = "colorist"
                    case coloristCover = "colorist (cover)"
                    case editor = "editor"
                    case inker = "inker"
                    case inkerCover = "inker (cover)"
                    case letterer = "letterer"
                    case other = "other"
                    case penciler = "penciler"
                    case pencilerCover = "penciler (cover)"
                    case penciller = "penciller"
                    case pencillerCover = "penciller (cover)"
                    case roleColorist = "Colorist"
                    case roleLetterer = "Letterer"
                    case rolePenciller = "Penciller"
                    case writer = "writer"
                }
            } //Creators



            // MARK: - Stories
            struct Stories: Decodable {
                let available: Int
                let collectionURI: String
                let items: [StoriesItem]
                let returned: Int
                
                // MARK: - StoriesItem
                struct StoriesItem: Decodable {
                    let resourceURI: String
                    let name: String
                    let type: ItemType
                }

                enum ItemType: String, Codable {
                    case cover = "cover"
                    case credits = "credits"
                    case empty = ""
                    case interiorStory = "interiorStory"
                    case pinup = "pinup"
                    case promo = "promo"
                    case tableOfContents = "table of contents"
                    case textArticle = "text article"
                }
            } //Stories



            // MARK: - Thumbnail
            struct Thumbnail: Decodable {
                let path: String?
                let thumbnailExtension: Extension?

                enum CodingKeys: String, CodingKey {
                    case path
                    case thumbnailExtension = "extension"
                }
                
                enum Extension: String, Codable {
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
            } //Thumbnail


            // MARK: - URLElement
            struct URLElement: Decodable {
                let type: URLType
                let url: String
                enum URLType: String, Codable {
                    case detail = "detail"
                    case wiki = "wiki"
                }
            } //URLElement

            
        } //Result
        
    }
    
}






