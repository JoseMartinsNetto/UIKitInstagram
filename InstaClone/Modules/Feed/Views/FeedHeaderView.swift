//
//  FeedHeaderView.swift
//  InstaClone
//
//  Created by Jose Martins on 15/11/22.
//

import UIKit

final class FeedHeaderView: UIStackView {
    
    let logo: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Logo")
        imageView.tintColor = .white
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    let iconsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillEqually
        stackView.axis = .horizontal
        stackView.spacing = 16
        
        return stackView
    }()
    
    let shareButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "Icon-Add"), for: .normal)
        button.tintColor = .white
        
        return button
    }()
    
    let commentButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "Icon-Comment"), for: .normal)
        button.tintColor = .white
        
        return button
    }()
    
    let addButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "Icon-Share"), for: .normal)
        button.tintColor = .white
        
        return button
    }()
    
    var onClikShare: (() -> Void)?
    var onClikAdd: (() -> Void)?
    var onClikComment: (() -> Void)?
    
    @objc private func clickShare() {
        self.onClikShare?()
    }
    
    @objc private func clickComment() {
        self.onClikComment?()
    }
    
    @objc private func clickAdd() {
        self.onClikAdd?()
    }
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        self.axis = .horizontal
        self.distribution = .equalSpacing
        
        self.addButton.addTarget(self, action: #selector(self.clickAdd), for: .touchUpInside)
        self.commentButton.addTarget(self, action: #selector(self.clickComment), for: .touchUpInside)
        self.shareButton.addTarget(self, action: #selector(self.clickShare), for: .touchUpInside)
        
        self.iconsStackView.addArrangedSubview(self.shareButton)
        self.iconsStackView.addArrangedSubview(self.commentButton)
        self.iconsStackView.addArrangedSubview(self.addButton)
        
        self.addArrangedSubview(self.logo)
        self.addArrangedSubview(self.iconsStackView)
        
        guard let superview = self.superview else { return }
        
        self.topAnchor.constraint(equalTo: superview.topAnchor, constant: 56).isActive = true
        self.leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: 16).isActive = true
        self.trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: -16).isActive = true
    }
}
