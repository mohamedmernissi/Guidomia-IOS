//
//  SystemFontMedium.swift
//  Guidomia
//
//  Created by mohamed mernissi on 1/9/2022.
//

import UIKit

class SystemFontMedium: BaseLabel {

    // MARK: - Functions

    override func setupLabel() {
        super.setupLabel()
        font = UIFont.systemFont(ofSize: 24, weight: .medium)
    }

}

class Medium18: SystemFontMedium {

    // MARK: - Functions

    override func setupLabel() {
        super.setupLabel()

        font = font.withSize(18)
        textColor = Constants.Color.whiteText
    }

}
