//
//  PostView.swift
//  InstaClone
//
//  Created by Jose Martins on 15/11/22.
//

import UIKit

final class PostView: UIView {
    
    private var postImage: UIImageView = {
        let imageView = UIImageView(image: .postExemple)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        
        return imageView
    }()
    
    private let userImage: UIImageView = {
        let imageView = UIImageView(image: .postExemple)
        imageView.layer.cornerRadius = 15
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private let userName: UILabel = {
        let label = UILabel(disableAutoResizing: true)
        label.text = "user_name"
        label.font = .systemFont(ofSize: 12, weight: .bold)
        label.textColor = .lightBlackDarkWhite
        
        return label
    }()
    
    private let postDescription: UILabel = {
        let label = UILabel(disableAutoResizing: true)
        label.textColor = .lightBlackDarkWhite
        label.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor numbas sator"
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 12)
        
        return label
    }()
    
    private let commentsNumber: UILabel = {
        let label = UILabel(disableAutoResizing: true)
        label.textColor = .lightBlackDarkWhite
        label.font = .systemFont(ofSize: 12)
        label.text = "2 comments"
        
        return label
    }()
    
    private let likesNumber: UILabel = {
        let label = UILabel(disableAutoResizing: true)
        label.textColor = .lightBlackDarkWhite
        label.font = .systemFont(ofSize: 12)
        label.text = "47 likes"
        
        return label
    }()
    
    @objc var onLike: (() -> Void)?
    
    private func setupPostImage() {
        addSubview(postImage)
        postImage.topAnchor.constraint(equalTo: topAnchor).isActive = true
        postImage.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        postImage.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        postImage.heightAnchor.constraint(equalToConstant: 375).isActive = true
    }
    
    private func setupUserImage() {
        addSubview(userImage)
        userImage.topAnchor.constraint(equalTo: postImage.bottomAnchor, constant: 24).isActive = true
        userImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        userImage.heightAnchor.constraint(equalToConstant: 30).isActive = true
        userImage.widthAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    private func setupUserName() {
        addSubview(userName)
        userName.centerYAnchor.constraint(equalTo: userImage.centerYAnchor).isActive = true
        userName.leadingAnchor.constraint(equalTo: userImage.trailingAnchor, constant: 12).isActive = true
    }
    
    private func setupPostDescription() {
        addSubview(postDescription)
        
        postDescription.topAnchor.constraint(equalTo: userImage.bottomAnchor, constant: 8).isActive = true
        postDescription.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        postDescription.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
    }
    
    private func setupPostFooter() {
        let likeButton: UIButton = .iconButton(icon: .iconHeart, iconColor: .lightBlackDarkWhite)
        likeButton.addTarget(self, action: #selector(getter: onLike), for: .touchUpInside)
        let commentButton: UIButton = .iconButton(icon: .iconComment, iconColor: .lightBlackDarkWhite)
        let shareButton: UIButton = .iconButton(icon: .iconShare, iconColor: .lightBlackDarkWhite)
        let moreButton: UIButton = .iconButton(icon: .iconMore, iconColor: .lightBlackDarkWhite)
        
        let postInfoStack = UIStackView(arrangedSubviews: [commentsNumber, likesNumber])
        postInfoStack.axis = .vertical
        postInfoStack.spacing = 3
        postInfoStack.alignment = .trailing
        
        let userActionsStack = UIStackView(arrangedSubviews: [likeButton, commentButton, shareButton, moreButton])
        userActionsStack.distribution = .fillEqually
        userActionsStack.spacing = 16
        
        let footerStack = UIStackView(disableAutoResizing: true)
        footerStack.distribution = .equalSpacing
        footerStack.addArrangedSubviews([userActionsStack, postInfoStack])
        
        addSubview(footerStack)
        
        footerStack.topAnchor.constraint(equalTo: self.postDescription.bottomAnchor, constant: 8).isActive = true
        footerStack.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16).isActive = true
        footerStack.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16).isActive = true
    }
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        setupPostImage()
        setupUserImage()
        setupUserName()
        setupPostDescription()
        setupPostFooter()
    }
}

#if canImport(SwiftUI) && DEBUG
import SwiftUI
struct PostPreview_Previews: PreviewProvider {
    static var previews: some View {
        UIViewPreview {
            PostView()
        }.preferredColorScheme(.dark)
    }
    
}
#endif
