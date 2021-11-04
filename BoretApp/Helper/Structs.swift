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
