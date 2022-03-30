//
//  Characters.swift
//  Marvel
//
//  Created by Ivan Valero on 28/03/2022.
//

import Foundation

// MARK: - PlaylistItems
struct PlaylistItems: Decodable {
    let code: Int
    let status, copyright, attributionText, attributionHTML: String
    let etag: String
    let data: DataClass
}

// MARK: - DataClass
struct DataClass: Decodable {
    let offset, limit, total, count: Int
    let results: [Result]
}

// MARK: - Result
struct Result: Decodable {
    let id: Int
    let name, resultDescription: String
    let modified: Date
    let thumbnail: Thumbnail
    let resourceURI: String
    let comics, series: Comics
    let stories: Stories
    let events: Comics
    let urls: [URLElement]

    enum CodingKeys: String, CodingKey {
        case id, name
        case resultDescription = "description"
        case modified, thumbnail, resourceURI, comics, series, stories, events, urls
    }
}

// MARK: - Comics
struct Comics: Decodable {
    let available: Int
    let collectionURI: String
    let items: [ComicsItem]
    let returned: Int
}

// MARK: - ComicsItem
struct ComicsItem: Decodable {
    let resourceURI: String
    let name: String
}

// MARK: - Stories
struct Stories: Decodable {
    let available: Int
    let collectionURI: String
    let items: [StoriesItem]
    let returned: Int
}

// MARK: - StoriesItem
struct StoriesItem: Decodable {
    let resourceURI: String
    let name: String
    let type: ItemType
}

enum ItemType: String, Codable {
    case cover = "cover"
    case empty = ""
    case interiorStory = "interiorStory"
}

// MARK: - Thumbnail
struct Thumbnail: Decodable {
    let path: String
    let thumbnailExtension: Extension

    enum CodingKeys: String, CodingKey {
        case path
        case thumbnailExtension = "extension"
    }
}

enum Extension: String, Decodable {
    case gif = "gif"
    case jpg = "jpg"
}

// MARK: - URLElement
struct URLElement: Decodable {
    let type: URLType
    let url: String
}

enum URLType: String, Decodable {
    case comiclink = "comiclink"
    case detail = "detail"
    case wiki = "wiki"
}






