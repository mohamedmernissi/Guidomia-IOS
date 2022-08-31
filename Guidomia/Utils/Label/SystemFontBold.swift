//
//  SystemFontBold.swift
//  Guidomia
//
//  Created by mohamed mernissi on 30/8/2022.
//

import UIKit

class SystemFontBold: BaseLabel {

    // MARK: - Functions

    override func setupLabel() {
        super.setupLabel()
        font = UIFont.systemFont(ofSize: 24, weight: .bold)
    }

}

class Bold24: SystemFontBold {

    // MARK: - Functions

    override func setupLabel() {
        super.setupLabel()

        font = font.withSize(24)
        textColor = Constants.Color.whiteText
    }

}

class Bold28: SystemFontBold {

    // MARK: - Functions

    override func setupLabel() {
        super.setupLabel()

        font = font.withSize(28)
        textColor = Constants.Color.whiteText
    }

}

class Bold20: SystemFontBold {

    // MARK: - Functions

    override func setupLabel() {
        super.setupLabel()

        font = font.withSize(20)
        textColor = Constants.Color.whiteText
    }

}

class Bold22: SystemFontBold {

    // MARK: - Functions

    override func setupLabel() {
        super.setupLabel()

        font = font.withSize(22)
    }

}

class Bold18: SystemFontBold {

    // MARK: - Functions

    override func setupLabel() {
        super.setupLabel()

        font = font.withSize(18)
    }

}

class Bold14: SystemFontBold {

    // MARK: - Functions

    override func setupLabel() {
        super.setupLabel()

        font = font.withSize(14)
        textColor = Constants.Color.bulletPointText
    }

}

