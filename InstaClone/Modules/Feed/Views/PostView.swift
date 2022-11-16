//
//  PostView.swift
//  InstaClone
//
//  Created by Jose Martins on 15/11/22.
//

import UIKit

final class PostView: UIView {
    let postImage: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "Post-Exemple"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    let userImage: UIImageView = {
        let imageView = UIImageView()
        
        return imageView
    }()
    
    override func willMove(toSuperview newSuperview: UIView?) {
        self.addSubview(self.postImage)
        
        self.postImage.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        self.postImage.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        self.postImage.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    }
    
}

#if canImport(SwiftUI) && DEBUG
import SwiftUI
struct PostPreview_Previews: PreviewProvider {
    static var previews: some View {
        UIViewPreview {
            return PostView()
        }
    }
    
}
#endif
