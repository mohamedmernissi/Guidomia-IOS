//
//  Extension.swift
//  Guidomia
//
//  Created by mohamed mernissi on 30/8/2022.
//

import UIKit

extension UIView {

    static var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }

    static var identifier: String {
        return String(describing: self)
    }

    func addSubview(childView: UIView) {
        addSubview(childView)
        addContainerConstraints(childView: childView)
    }

    private func addContainerConstraints(childView: UIView) {
        // Adding Constraints to the superview
        childView.translatesAutoresizingMaskIntoConstraints = false
        let topConstraint = NSLayoutConstraint(item: childView, attribute: .top, relatedBy: .equal,
                                               toItem: self, attribute: .top,
                                               multiplier: 1, constant: 0)
        let bottomConstraint = NSLayoutConstraint(item: childView, attribute: .bottom, relatedBy: .equal,
                                                  toItem: self, attribute: .bottom,
                                                  multiplier: 1, constant: 0)
        let leadingConstraint = NSLayoutConstraint(item: childView, attribute: .leading, relatedBy: .equal,
                                                   toItem: self, attribute: .leading,
                                                   multiplier: 1, constant: 0)
        let trailingConstraint = NSLayoutConstraint(item: childView, attribute: .trailing, relatedBy: .equal,
                                                    toItem: self, attribute: .trailing,
                                                    multiplier: 1, constant: 0)

        addConstraints([topConstraint, bottomConstraint, leadingConstraint, trailingConstraint])
        layoutIfNeeded()
    }

    func parentView<T: UIView>(of type: T.Type) -> T? {
        guard let view = superview else {
            return nil
        }
        return (view as? T) ?? view.parentView(of: T.self)
    }

    func roundCorners(_ corners: UIRectCorner,
                      radius: CGFloat,
                      borderColor: UIColor? = nil,
                      borderWidth: CGFloat = 0) {
        clipsToBounds = true
        layer.cornerRadius = radius
        if let borderColor = borderColor {
            layer.borderColor = borderColor.cgColor
            layer.borderWidth = borderWidth
        }
        layer.maskedCorners = CACornerMask(rawValue: corners.rawValue)
    }
}

extension UITableViewCell {
    var tableView: UITableView? {
        return parentView(of: UITableView.self)
    }
}
