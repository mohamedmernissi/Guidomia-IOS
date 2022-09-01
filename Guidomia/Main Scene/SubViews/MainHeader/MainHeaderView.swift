//
//  MainHeaderView.swift
//  Guidomia
//
//  Created by mohamed mernissi on 1/9/2022.
//

import UIKit

protocol MainHeaderViewDelegate: AnyObject {
    func didSelectMake(make: String?, model: String?, header: MainHeaderView)
    func clearFilters(header: MainHeaderView)
}

class MainHeaderView: GenericView {

    // MARK: - @IBOutlets

    @IBOutlet weak var txtMake: PickerTextField!
    @IBOutlet weak var txtModel: PickerTextField!
    @IBOutlet weak var filterView: UIView!

    // MARK: - Properties

    weak var delegate: MainHeaderViewDelegate?

    override func nibSetup() {
        if let _ = super.setupView(nibName: MainHeaderView.identifier) {
            filterView.roundCorners(.allCorners, radius: Constants.Corner.mediumCorner)
            txtMake.pickerdelegate = self
            txtModel.pickerdelegate = self
        }
    }

    func setupMakes(_ array: [String]) {
        txtMake.setup(data: array)
    }

    func setupModels(_ array: [String]) {
        txtModel.setup(data: array)
    }

    func clearFields() {
        txtMake.text = ""
        txtModel.text = ""
    }

    @IBAction func clearFilters(_ sender: UIButton) {
        delegate?.clearFilters(header: self)
    }
}

extension MainHeaderView: PickerTextFieldDelegate {
    func didSelectDone(field: PickerTextField) {
        delegate?.didSelectMake(make: txtMake.text, model: txtModel.text, header: self)
    }
}
