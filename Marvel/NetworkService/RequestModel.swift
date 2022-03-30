//
//  RequestModel.swift
//  Marvel
//
//  Created by Ivan Valero on 28/03/2022.
//

import Foundation


struct RequestModel {
    let endpoint: Endpoints
    var queryItems: [String:String]?
    let httpMethod: HttpMethod = .GET
    var baseUrl: URLBase = .marvel
    
    func getURL() -> String {
        return baseUrl.rawValue + endpoint.rawValue
    }
    
    enum HttpMethod: String {
        case GET
        case POST
    }
    
    enum Endpoints: String {
        case search = "/characters"
        case empty = ""
    }
    
    enum URLBase: String {
        case marvel = "https://gateway.marvel.com:443/v1/public"
    }
    
    
    
    
}

