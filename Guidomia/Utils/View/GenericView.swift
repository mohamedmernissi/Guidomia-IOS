//
//  GenericView.swift
//  Guidomia
//
//  Created by mohamed mernissi on 30/8/2022.
//

import UIKit

class GenericView: UIView {

    // MARK: - Variables

    var view: UIView?

    // MARK: - Initializer

    override init(frame: CGRect) {
        super.init(frame: frame)
        nibSetup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        nibSetup()
    }

    // MARK: - Functions

    internal func nibSetup() {
        // Overridden function
    }

    internal func setupView(nibName: String) -> UIView? {

        view = loadViewFromNib(nibName: nibName)

        if let view = view {
            addSubview(childView: view)
        }

        return view
    }

    internal func loadViewFromNib(nibName: String) -> UIView? {

        if !nibName.isEmpty {
            let bundle = Bundle(for: type(of: self))
            let nib = UINib(nibName: nibName, bundle: bundle)
            let view = nib.instantiate(withOwner: self, options: nil).first as? UIView

            return view
        } else {
            return nil
        }
    }
}
