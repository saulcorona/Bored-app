//
//  ActivityModel.swift
//  BoretApp
//
//  Created by Sebastian San Blas on 05/11/2021.
//

import Foundation
import ProgressHUD

class ActivityModel {
    
    private let activityServices: RandomServices
    private let typeServices: TypeServices
    
    var activity: Activity!
    let defaultActivity = Activity(name: "", type: "", participants: 0, price: 0.0)
    var fromRandom: Bool = true

    init(activityServices: RandomServices,
         typeServices: TypeServices) {
        self.activityServices = activityServices
        self.typeServices = typeServices
    }
    
    func getRandomActivity(for participants: Int, completition: @escaping () -> Void) {
        activityServices.getRandomActivity(for: participants) { result in
            if !result.isEmpty {
                self.activity = result[0]
            } else {
                self.activity = self.defaultActivity
            }
            completition()
        }
    }
    
    func getTypeActivity(for participants: Int, with activity: String, completition: @escaping () -> Void) {
        typeServices.getTypeActivity(for: participants, with: activity) { result in
            if !result.isEmpty {
                self.activity = result[0]
            } else {
                self.activity = self.defaultActivity
            }
            completition()
        }
    }
}
