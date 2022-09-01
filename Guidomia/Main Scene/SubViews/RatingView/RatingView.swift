//
//  RatingView.swift
//  Guidomia
//
//  Created by mohamed mernissi on 30/8/2022.
//

import UIKit

class RatingView: GenericView {

    // MARK: - IBOutlets

    @IBOutlet private weak var stackView: UIStackView!
    @IBOutlet private var imgStars: [UIImageView]!

    override func nibSetup() {
        if let _ = super.setupView(nibName: RatingView.identifier) { }
    }

    func setRating(_ rating: Int) {
        stackView.subviews.forEach { ratingView in
            if ratingView.tag < rating {
                ratingView.isHidden = false
            } else {
                ratingView.isHidden = true
            }
        }
    }
}
