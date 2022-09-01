//
//  CarsResponseData.swift
//  Guidomia
//
//  Created by mohamed mernissi on 31/8/2022.
//

import Foundation

// MARK: - CarsResponseElement
struct CarsResponseElement: Codable {
    let consList: [String]
    let customerPrice: Int
    let make: String
    let marketPrice: Int
    let model: String
    let prosList: [String]
    let rating: Int
}

typealias CarsResponse = [CarsResponseElement]
