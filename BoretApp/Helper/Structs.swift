//
//  Structs.swift
//  BoretApp
//
//  Created by Sebastian San Blas on 03/11/2021.
//

import Foundation

// MARK: - Activity
struct Activity: Codable {
    let name, type: String
    let participants: Int
    let price: Double
}

extension Activity {
    enum CodingKeys: String, CodingKey {
        case type, participants, price
        case name = "activity"
    }
}

// MARK: - Price
struct Price {

    static func convertToPriceString(input: Double) -> String {
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
