//
//  UIStackViewExtension.swift
//  InstaClone
//
//  Created by Jose Martins on 23/11/22.
//

import UIKit

extension UIStackView {
    func addArrangedSubviews(_ views: [UIView]) {
        for view in views {
            addArrangedSubview(view)
        }
        setNeedsLayout()
    }
}
