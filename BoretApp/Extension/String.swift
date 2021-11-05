//
//  String.swift
//  BoretApp
//
//  Created by Sebastian San Blas on 04/11/2021.
//

import Foundation

extension StringProtocol {
    var firstUppercased: String { prefix(1).uppercased() + dropFirst() }
}
