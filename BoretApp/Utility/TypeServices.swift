//
//  TypeServices.swift
//  BoretApp
//
//  Created by Sebastian San Blas on 04/11/2021.
//

import Foundation
import ProgressHUD

class TypeServices {
    
    func getTypeActivity(for participants: Int?,
                         with type: String,
                         completion: @escaping ([Activity]) -> Void) {
//        ProgressHUD.show()
        let typeURL = Services.activityType(participants: participants, type: type)
        
        Services.getServices(url: typeURL) { response in
            switch response {
            case .success(let data):
                do {
                    guard data != nil else {
                        completion([])
//                        ProgressHUD.showError()
                        return
                    }
                    let activity = try JSONDecoder().decode(Activity.self, from: data!)
//                    ProgressHUD.dismiss()
                    completion([activity])
                } catch {
//                    ProgressHUD.showError("Falló.", image: nil, interaction: true)
                    completion([])
                }
            case .failure(let error):
                print(error)
//                ProgressHUD.showError("Se agotó el tiempo de espera.", image: nil, interaction: true)
                completion([])
            }
        }
    }
}
