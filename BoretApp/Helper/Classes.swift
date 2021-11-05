//
//  Classes.swift
//  BoretApp
//
//  Created by Saul Corona Santos on 04/11/21.
//

import Foundation

class User {
    static let shared = User()
    
    private init(){}
    
    var participants: Int?
}

class another {
    func convertToPriceString(input: Double) -> String {
        switch input {
        case 0:
            return "Free"
        case 0...0.3:
            return "Low"
        case 0.3...0.6:
            return "Medium"
        case 0.6...:
            return "High"
        default:
            return "N/A"
        }
    }
}
