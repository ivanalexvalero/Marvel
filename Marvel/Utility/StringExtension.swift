//
//  StringExtension.swift
//  Marvel
//
//  Created by Ivan Valero on 15/07/2022.
//

import Foundation


func toString(dateModel: String) -> String {
    let formatter = DateFormatter()
    //        formatter.locale = Locale(identifier: "en_US_POSIX")
    formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
    let newDate = formatter.date(from: dateModel)
    formatter.dateFormat = "dd 'de' MMMM yyyy"
    let myStringDate = formatter.string(from: newDate!)
    print("Fecha: ", myStringDate)
    return myStringDate
    
}
