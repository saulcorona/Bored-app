//
//  RandomServices.swift
//  BoretApp
//
//  Created by Sebastian San Blas on 04/11/2021.
//

import Foundation

class RandomServices {
    
    func getRandomActivity(for participants: Int?, completion: @escaping ([Activity]) -> Void) {

        let randomURL = Services.activityRandom(participants: participants)
        Services.getServices(url: randomURL) { response in
            switch response {
            case .success(let data):
                do {
                    guard data != nil else {
                        completion([])
                        return
                    }
                    let activity = try JSONDecoder().decode(Activity.self, from: data!)
                    completion([activity])
                } catch {
                    completion([])
                }
            case .failure(_):
                completion([])
            }
        }
    }
}

