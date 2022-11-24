//
//  UIButtonExtension.swift
//  InstaClone
//
//  Created by Jose Martins on 16/11/22.
//

import UIKit

extension UIButton {
    class func iconButton(icon: UIImage, iconColor: UIColor? = nil, backgroundColor: UIColor? = nil, tag: Int = 0) -> UIButton {
        let button = UIButton()
        button.setImage(icon, for: .normal)
        button.tag = tag
        button.tintColor = iconColor
        button.backgroundColor = backgroundColor
        
        return button
    }
    
    class func userButton(icon: UIImage, tag: Int = 0) -> UIButton {
        let button = UIButton()
        button.tag = tag
        button.clipsToBounds = true
        button.setImage(icon, for: .normal)
        
        return button
    }
}
