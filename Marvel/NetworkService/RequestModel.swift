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
    let route: Route

    enum Route {

        case details(String)
        case noneId

        
        var description: String {
            switch self {
            case .details(let detailsId):
                return "/\(detailsId)"
            case .noneId:
                return ""
            }
        }
    }

    
    func getURL() -> String {
        return baseUrl.rawValue + endpoint.rawValue + route.description
    }
    
    enum HttpMethod: String {
        case GET
        case POST
    }
    
    enum Endpoints: String   {

           case character = "/characters"
           case events = "/events"
           case empty = ""
    }
    
    enum URLBase: String {
        case marvel = "https://gateway.marvel.com/v1/public"
    }
    
    
    
    
}

