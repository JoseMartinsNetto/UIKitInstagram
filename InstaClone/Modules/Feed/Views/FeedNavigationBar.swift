//
//  FeedHeaderView.swift
//  InstaClone
//
//  Created by Jose Martins on 15/11/22.
//

import UIKit

enum FeedHeaderAction {
    case add
    case comment
    case share
}

protocol FeedNavigationBarDelegate: AnyObject {
    func feedHeaderView(onClick action: FeedHeaderAction)
}

final class FeedNavigationBar: UINavigationBar {
    weak var feedNavigationDelegate: FeedNavigationBarDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        isTranslucent = false
        
        let logo = UIImageView(disableAutoResizing: true)
        logo.image = .logo
        logo.tintColor = .lightBlackDarkWhite
        
        let shareButton: JMButton = .iconButton(icon: .iconShare, iconColor: .lightBlackDarkWhite)
        let commentButton: JMButton = .iconButton(icon: .iconComment, iconColor: .lightBlackDarkWhite)
        let addButton: JMButton = .iconButton(icon: .iconAdd, iconColor: .lightBlackDarkWhite)
        
        let buttonsStack = UIStackView(arrangedSubviews: [addButton, commentButton, shareButton])
        buttonsStack.distribution = .fillEqually
        buttonsStack.axis = .horizontal
        buttonsStack.spacing = 16
        
        let generalStack = UIStackView(arrangedSubviews: [logo, buttonsStack])
        generalStack.translatesAutoresizingMaskIntoConstraints = false
        generalStack.axis = .horizontal
        generalStack.distribution = .equalSpacing
        
        addSubview(generalStack)
        
        heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        generalStack.topAnchor.constraint(equalTo: topAnchor).isActive = true
        generalStack.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        generalStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        generalStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
