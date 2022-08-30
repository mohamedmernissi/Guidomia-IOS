//
//  BaseLabel.swift
//  Guidomia
//
//  Created by mohamed mernissi on 30/8/2022.
//

import UIKit

class BaseLabel: UILabel {

    // MARK: - Initializer

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLabel()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupLabel()
    }

    // MARK: - Functions

    internal func setupLabel() {
        textColor = Constants.Color.text
    }

}
