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

struct CellState {
    
    var isExpanded: Bool

    init(){
        isExpanded = false
    }
}

class CarDetailsCell: UITableViewCell {

    // MARK: - @IBOutlet

    @IBOutlet weak var carInfoView: UIView!
    @IBOutlet weak var prosView: UIView!
    @IBOutlet weak var consView: UIView!
    @IBOutlet weak var buttonToggleViews: UIButton!
    @IBOutlet weak var ratingView: RatingView!

    weak var delegate: CarDetailsCellDelegate?
    var isExpanded = false

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        ratingView.setRating(4)
    }

    @IBAction func showCarDetailsTapped(_ sender: UIButton) {
        delegate?.showCarDetailsTapped(self, sender)
    }

    func toggleViews() {
        prosView.isHidden = !isExpanded
        consView.isHidden = !isExpanded
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
