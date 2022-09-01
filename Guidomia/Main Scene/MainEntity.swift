//
//  MainModel.swift
//  Guidomia
//
//  Created by mohamed mernissi on 31/8/2022.
//

import Foundation

struct MainEntity {

    var cellState: CellState
    let consList: [String]
    let customerPrice: Int
    let make: String
    let marketPrice: Int
    let model: String
    let prosList: [String]
    let rating: Int
    let pros: [DottedLabelView]
    let cons: [DottedLabelView]

}

struct CellState {

    var isExpanded: Bool

    init(){
        isExpanded = false
    }
}
