//
//  FeedViewController.swift
//  InstaClone
//
//  Created by Jose Martins on 15/11/22.
//

import UIKit

final class FeedViewController: UIViewController {
    
    let header: FeedHeaderView = {
        let view = FeedHeaderView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    let postView: PostView = {
        let view = PostView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .black
        
        self.setupHeader()
        
        self.view.addSubview(self.postView)
        self.postView.topAnchor.constraint(equalTo: self.header.bottomAnchor, constant: 24).isActive = true
        self.postView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        self.postView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        
        self.view.layoutIfNeeded()
    }
    
    private func setupHeader() {
        self.view.addSubview(self.header)
        
        self.header.onClikAdd = {
            print("onClikAdd")
        }
        
        self.header.onClikComment = {
            print("onClikComment")
        }
        
        self.header.onClikShare = {
            print("onClikShare")
        }
    }
}

#if canImport(SwiftUI) && DEBUG
import SwiftUI
struct CurrentPreview_Previews: PreviewProvider {
    static var previews: some View {
        UIViewControllerPreview {
            return FeedViewController()
        }
    }
}
#endif

