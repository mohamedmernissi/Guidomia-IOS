//
//  CarDetailsCell.swift
//  Guidomia
//
//  Created by mohamed mernissi on 30/8/2022.
//

import UIKit

protocol CarDetailsCellDelegate: AnyObject {
    func showCarDetailsTapped(_ cell: CarDetailsCell, _ sender: UIButton)
}

class CarDetailsCell: UITableViewCell {

    // MARK: - @IBOutlet

    @IBOutlet weak var lblCarName: Bold22!
    @IBOutlet weak var lblPrice: Bold18!
    @IBOutlet weak var imgCar: UIImageView!
    @IBOutlet weak var carInfoView: UIView!
    @IBOutlet weak var prosView: UIView!
    @IBOutlet weak var consView: UIView!
    @IBOutlet weak var buttonToggleViews: UIButton!
    @IBOutlet weak var ratingView: RatingView!

    @IBOutlet weak var prosStackView: UIStackView!
    @IBOutlet weak var consStackView: UIStackView!

    weak var delegate: CarDetailsCellDelegate?
    private var isExpanded = false

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setup(with data: MainEntity) {
        lblCarName.text = data.make + " " + data.model
        lblPrice.text = "Price: " + String(data.marketPrice)
        ratingView.setRating(data.rating)
        for item in data.pros {
            prosStackView.addArrangedSubview(item)
        }

        for item in data.cons {
            consStackView.addArrangedSubview(item)
        }
        imgCar.image = UIImage(named: data.make)
        isExpanded = data.cellState.isExpanded
        toggleViews()
    }

    @IBAction func showCarDetailsTapped(_ sender: UIButton) {
        delegate?.showCarDetailsTapped(self, sender)
    }

    func toggleViews() {
        prosView.isHidden = !isExpanded
        consView.isHidden = !isExpanded
    }
}
