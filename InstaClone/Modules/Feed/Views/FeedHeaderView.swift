//
//  FeedHeaderView.swift
//  InstaClone
//
//  Created by Jose Martins on 15/11/22.
//

import UIKit

final class FeedHeaderView: UIStackView {
    
    private let logo: UIImageView = {
        let imageView = UIImageView(disableAutoResizing: true)
        imageView.image = .logo
        imageView.tintColor = .lightBlackDarkWhite
        
        return imageView
    }()
    
    private let iconsStackView: UIStackView = {
        let stackView = UIStackView(disableAutoResizing: true)
        stackView.distribution = .fillEqually
        stackView.axis = .horizontal
        stackView.spacing = 16
        
        return stackView
    }()
    
    @objc var onClikShare: (() -> Void) = {}
    @objc var onClikAdd: (() -> Void) = {}
    @objc var onClikComment: (() -> Void) = {}
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        self.axis = .horizontal
        self.distribution = .equalSpacing
        
        let shareButton: UIButton = .iconButton(icon: .iconShare, iconColor: .lightBlackDarkWhite)
        let commentButton: UIButton = .iconButton(icon: .iconComment, iconColor: .lightBlackDarkWhite)
        let addButton: UIButton = .iconButton(icon: .iconAdd, iconColor: .lightBlackDarkWhite)
        
        addButton.addTarget(self, action: #selector(self.onAddClickEvent), for: .touchUpInside)
        commentButton.addTarget(self, action: #selector(self.onCommentClickEvent), for: .touchUpInside)
        shareButton.addTarget(self, action: #selector(self.onShareClickEvent), for: .touchUpInside)
        
        iconsStackView.addArrangedSubview(addButton)
        iconsStackView.addArrangedSubview(commentButton)
        iconsStackView.addArrangedSubview(shareButton)
        
        self.addArrangedSubview(self.logo)
        self.addArrangedSubview(self.iconsStackView)
    }
    
    @objc private func onAddClickEvent() {
        self.onClikAdd()
    }
    
    @objc private func onCommentClickEvent() {
        self.onClikComment()
    }
    
    @objc private func onShareClickEvent() {
        self.onClikShare()
    }
}
