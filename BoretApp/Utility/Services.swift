//
//  Services.swift
//  BoretApp
//
//  Created by Sebastian San Blas on 03/11/2021.
//

import Foundation
import Alamofire

class Services {
    
    private static let endpointURL = "https://www.boredapi.com"
    
    static func activityRandom(participants: Int? = nil) -> String {
        guard participants != nil else {
            return String(format: "%@/api/activity?participants=1", endpointURL)
        }
        return String(format: "%@/api/activity?participants=%@", endpointURL, String(participants!))
    }

    static func activityType(participants: Int? = nil, type: String) -> String {
        guard participants != nil else {
            return String(format: "%@/api/activity?participants=1", endpointURL)
        }
        return String(format: "%@/api/activity?participants=%@&type=%@", endpointURL, String(participants!), type)
    }

    static func getServices(url: String, completion: @escaping (Result<Data?, AFError>) -> Void) {
        AF.request(url).response { response in
            completion(response.result)
        }
    }
}
