//
//  Picker
//  Guidomia
//
//  Created by mohamedmernissi on 25/09/2020.
//  Copyright © 2020 mohamedmernissi. All rights reserved.
//

import Foundation
import UIKit

protocol PickerSourceDelegate: AnyObject {
    func didSelectItem(item: String, index: Int)
}

class PickerSource: NSObject, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var data: [[String]] = []
    var selectedItem = ""
    var selectedRow = 0
    var selectionUpdated: ((_ component: Int, _ row: Int) -> Void)?
    weak var delegate: PickerSourceDelegate?
    
    // MARK: - UIPickerViewDataSource
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return data.count
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        let rows = data[component]
        return rows.count
    }
    
    // MARK: - UIPickerViewDelegate
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(data[component][row])"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        guard !data.isEmpty else {
            return
        }
        self.selectedItem = data[component][row]
        self.selectedRow = row
        print("self.selectedItem:", self.selectedItem)
        print("self.selectedRow:", self.selectedRow)
        delegate?.didSelectItem(item: self.selectedItem, index: row)
        selectionUpdated?(component, row)
    }
}

class Picker<T>: UIPickerView, UIGestureRecognizerDelegate {
    
    var data: [[T]] = [] {
        didSet {
            source.data = data.map { $0.map { "\($0)" } }
            reloadAllComponents()
        }
    }
    
    var selectionUpdated: ((_ selections: [T?]) -> Void)?
    
    let source = PickerSource()
    
    // MARK: - Initialization
    
    convenience init() {
        self.init(frame: CGRect.zero)
    }
    
    convenience init(data: [[T]]) {
        self.init(frame: CGRect.zero)
        self.data = data
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        setup()
    }
    
    // MARK: - Setup
    
    private func setup() {
        dataSource = source
        delegate = source
        self.addTapGesture()
        source.selectionUpdated = { [weak self] _, _ in
            if let _self = self {
                var selections: [T?] = []
                for (idx, componentData) in (_self.data).enumerated() {
                    let selectedRow = _self.selectedRow(inComponent: idx)
                    if selectedRow >= 0 {
                        selections.append(componentData[selectedRow])
                    } else {
                        selections.append(nil)
                    }
                }
                _self.selectionUpdated?(selections)
            }
        }
    }
    
    func addTapGesture() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(pickerTapped))
        tap.delegate = self
        self.addGestureRecognizer(tap)
    }
    
    @objc func pickerTapped(tapRecognizer: UITapGestureRecognizer) {
        if tapRecognizer.state == .ended {
            let rowHeight = self.rowSize(forComponent: 0).height
            let selectedRowFrame = self.bounds.insetBy(dx: 0, dy: (self.frame.height - rowHeight) / 2)
            let userTappedOnSelectedRow = selectedRowFrame.contains(tapRecognizer.location(in: self))
            if userTappedOnSelectedRow {
                let selectedRow = self.selectedRow(inComponent: 0)
                self.source.pickerView(self, didSelectRow: selectedRow, inComponent: 0)
            }
        }
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}
