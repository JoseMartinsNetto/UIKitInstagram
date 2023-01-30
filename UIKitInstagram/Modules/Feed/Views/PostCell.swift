//
//  PostCell.swift
//  InstaClone
//
//  Created by Jose Martins on 23/11/22.
//

import UIKit

final class PostCell: UITableViewCell {
   private let postView = PostView(disableAutoResizing: true)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(postView)
        
        postView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        postView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        postView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        postView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
