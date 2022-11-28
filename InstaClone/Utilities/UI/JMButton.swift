//
//  JMButton.swift
//  InstaClone
//
//  Created by Jose Martins on 24/11/22.
//

import UIKit

final class JMButton: UIButton {
    var onClick: ((_ sender: JMButton) -> Void)?
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        
        addTarget(self, action: #selector(onClickEvent), for: .touchUpInside)
    }
    
    class func iconButton(icon: UIImage, iconColor: UIColor? = nil, backgroundColor: UIColor? = nil, tag: Int = 0) -> JMButton {
        let button = JMButton(frame: .zero)
        button.setImage(icon, for: .normal)
        button.tag = tag
        button.tintColor = iconColor
        button.backgroundColor = backgroundColor
        
        return button
    }
    
    class func userButton(icon: UIImage, tag: Int = 0) -> JMButton {
        let button = JMButton()
        button.tag = tag
        button.clipsToBounds = true
        button.setImage(icon, for: .normal)
        
        return button
    }
    
    @objc private func onClickEvent(_ sender: JMButton) {
        onClick?(sender)
    }
}
