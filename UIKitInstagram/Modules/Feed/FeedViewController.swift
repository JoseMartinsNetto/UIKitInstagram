//
//  FeedViewController.swift
//  InstaClone
//
//  Created by Jose Martins on 15/11/22.
//

import UIKit

final class FeedViewController: InstaViewController,
                                FeedNavigationBarDelegate,
                                UITableViewDataSource,
                                UITableViewDelegate {
    
    private let postsList = UITableView(disableAutoResizing: true)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupPostList()
        
        if let navigationBar = navigationController?.navigationBar as? FeedNavigationBar {
            navigationBar.feedNavigationDelegate = self
        }
        
        view.layoutIfNeeded()
    }
    
    //-----------------------------------------------------------------------
    //    MARK: - UITableViewDelegate, DataSource
    //-----------------------------------------------------------------------
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       return tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath)
    }
    
    //-----------------------------------------------------------------------
    //    MARK: - FeedHeaderViewDelegate
    //-----------------------------------------------------------------------
    
    func feedHeaderView(onClick action: FeedHeaderAction) {
        print(action)
    }

    //-----------------------------------------------------------------------
    //    MARK: - CustomMethods
    //-----------------------------------------------------------------------

    private func setupPostList() {
        postsList.delegate = self
        postsList.dataSource = self
        
        postsList.separatorStyle = .none
        postsList.showsVerticalScrollIndicator = false
        postsList.allowsSelection = false
        postsList.rowHeight = 530
        
        postsList.register(PostCell.self, forCellReuseIdentifier: "PostCell")
        
        view.addSubview(postsList)
        
        postsList.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        postsList.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        postsList.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        postsList.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
}

#if canImport(SwiftUI) && DEBUG
import SwiftUI

struct FeedPreview_Previews: PreviewProvider {
    static var previews: some View {
        UIViewControllerPreview {
            FeedViewController()
        }
    }
}

#endif
