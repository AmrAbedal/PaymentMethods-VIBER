//
//  PaymentMethod.swift
//  PaymentMethods
//
//  Created by Amr AbdelWahab on 5/7/21.
//

import Foundation
//MARK: - PaymentMethod
struct PaymentMethod: Codable {
    let code: String
    let label:String
    let method: String
    let grouping: String
    let registration: String
    let recurrence: String
    let redirect: Bool
    let links: Links
}
//MARK: - Links
struct Links: Codable {
    let logo: String
    let lang: String
    let operation: String
    let validation: String
}
