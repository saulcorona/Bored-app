//
//  RandomServices.swift
//  BoretApp
//
//  Created by Sebastian San Blas on 04/11/2021.
//

import Foundation
import ProgressHUD

class RandomServices {
    
    func getRandomActivity(for participants: Int?, completion: @escaping ([Activity]) -> Void) {
        let randomURL = Services.activityRandom(participants: participants)
        Services.getServices(url: randomURL) { response in
            switch response {
            case .success(let data):
                do {
                    guard data != nil else {
                        completion([])
                        ProgressHUD.showError()
                        return
                    }
                    let activity = try JSONDecoder().decode(Activity.self, from: data!)
                    completion([activity])
                } catch {
                    ProgressHUD.showError("Falló.", image: nil, interaction: true)
                    completion([])
                }
            case .failure(let error):
                print(error)
                ProgressHUD.showError("Se agotó el tiempo de espera.", image: nil, interaction: true)
                completion([])
            }
        }
    }
}

