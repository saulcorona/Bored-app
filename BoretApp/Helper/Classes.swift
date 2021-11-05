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
