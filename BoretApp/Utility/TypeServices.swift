//
//  TypeServices.swift
//  BoretApp
//
//  Created by Sebastian San Blas on 04/11/2021.
//

import Foundation

class TypeServices {
    
    func getTypeActivity(for participants: Int?,
                         with type: String,
                         completion: @escaping ([Activity]) -> Void) {

        let typeURL = Services.activityType(participants: participants, type: type)
        Services.getServices(url: typeURL) { response in
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
            case .failure(let error):
                completion([])
            }
        }
    }
}
