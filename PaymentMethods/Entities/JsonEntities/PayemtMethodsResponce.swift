//
//  PayemtMethodsResponce.swift
//  PaymentMethods
//
//  Created by Amr AbdelWahab on 5/7/21.
//

import Foundation

//MARK: - PayemtMethodsResponce
struct PayemtMethodsResponce: Codable {
    let networks: Applicable
}

//MARK: - Applicable
struct Applicable: Codable {
    let applicable: [PaymentMethod]
}



