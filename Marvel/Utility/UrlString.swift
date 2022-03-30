//
//  UrlString.swift
//  Marvel
//
//  Created by Ivan Valero on 29/03/2022.
//

import Foundation


extension String {
    var asUrl: URL? {
        return URL(string: self)
    }
}
