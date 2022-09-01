//
//  PickerTextField.swift
//  Guidomia
//
//  Created by mohamedmernissi on 9/25/20.
//  Copyright © 2020 mohamedmernissi. All rights reserved.
//

import UIKit

@objc protocol PickerTextFieldDelegate {
    @objc optional func didSelectDone(field: PickerTextField)
    @objc optional func didSelectCancel()
}
class PickerTextField: NoSelectTextField {
    weak var pickerdelegate: PickerTextFieldDelegate?
    private var picker = Picker<String>()
    var selectedIndex = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)!
    }
    
    func setup(data: [String]) {
        guard !data.isEmpty else {
            self.isEnabled = false
            return
        }
        self.isEnabled = true
        self.tintColor = .clear
        self.picker.data = [data]
        picker.source.delegate = self
        self.setPicker(picker)
    }
    
    func setPicker(_ inputView: UIView) {
        let textField = self
        textField.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
        textField.inputView = inputView
        if #available(iOS 12.0, *) {
            textField.textContentType = .oneTimeCode
        } else {
            // Fallback on earlier versions
        }
        // ToolBar
        let toolBar = UIToolbar()
        toolBar.barStyle = .default
        toolBar.isTranslucent = true
        toolBar.tintColor = Constants.Color.orange
        toolBar.sizeToFit()

        // Adding Button ToolBar
        let doneButton = UIBarButtonItem(title: "done", style: .done, target: self, action: #selector(doneClick))
        doneButton.tintColor = Constants.Color.orange
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "cancel", style: .plain, target: self, action: #selector(cancelClick))
        cancelButton.tintColor = Constants.Color.orange
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        textField.inputAccessoryView = toolBar
    }
    @objc func doneClick() {
        self.endEditing()
    }
    @objc func cancelClick() {
        self.endEditing()
    }
    
    func endEditing() {
        if let delegate = pickerdelegate {
            delegate.didSelectDone!(field: self)
            self.endEditing(true)
        } else {
            self.endEditing(true)
        }
    }
}
extension PickerTextField: PickerSourceDelegate {
    func didSelectItem(item: String, index: Int) {
        self.text = item
        self.selectedIndex = index
        if let delegate = pickerdelegate {
            delegate.didSelectDone!(field: self)
        }
    }
}
