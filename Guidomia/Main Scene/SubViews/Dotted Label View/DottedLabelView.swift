//
//  DottedLabelView.swift
//  Guidomia
//
//  Created by mohamed mernissi on 30/8/2022.
//

import UIKit

class DottedLabelView: GenericView {

    @IBOutlet weak var lblTitle: Bold14!

    override func nibSetup() {
        if let _ = super.setupView(nibName: DottedLabelView.identifier) {

        }
    }

    func setup(with title: String) {
        lblTitle.text = title
    }
}
