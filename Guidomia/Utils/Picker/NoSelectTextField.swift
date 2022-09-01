//
//  NoSelectTextField.swift
//  Guidomia
//
//  Created by mohamed mernissi on 2/22/21.
//  Copyright © 2021 raoui mouad. All rights reserved.
//

import UIKit

class NoSelectTextField: UITextField {

    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        false
    }

    override func selectionRects(for range: UITextRange) -> [UITextSelectionRect] {
        []
    }

    override func caretRect(for position: UITextPosition) -> CGRect {
        .zero
    }

}
