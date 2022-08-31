//
//  RatingView.swift
//  Guidomia
//
//  Created by mohamed mernissi on 30/8/2022.
//

import UIKit

class RatingView: GenericView {

    // MARK: - IBOutlets

    @IBOutlet var imgStars: [UIImageView]!

    override func nibSetup() {
        if let _ = super.setupView(nibName: RatingView.identifier) {

        }
    }

    func setRating(_ rating: Int) {
        for i in 0...imgStars.count {
            guard i < rating else {
                continue
            }
            imgStars[i].isHidden = false
        }
    }
}
