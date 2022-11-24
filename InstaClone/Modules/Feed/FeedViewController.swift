//
//  FeedViewController.swift
//  InstaClone
//
//  Created by Jose Martins on 15/11/22.
//

import UIKit

final class FeedViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {
    
    private let header = FeedHeaderView(disableAutoResizing: true)
    private let postsList = UITableView(disableAutoResizing: true)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        setupHeader()
        setupPostList()
        
        view.layoutIfNeeded()
    }
    
    //-----------------------------------------------------------------------
    //    MARK: - UITableViewDelegate, DataSource
    //-----------------------------------------------------------------------
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath)
        
        return cell
    }
    //-----------------------------------------------------------------------
    //    MARK: - CustomMethods
    //-----------------------------------------------------------------------

    private func setupPostList() {
        postsList.delegate = self
        postsList.dataSource = self
        
        postsList.separatorStyle = .none
        postsList.rowHeight = 530
        postsList.showsVerticalScrollIndicator = false
        postsList.allowsSelection = false
        
        postsList.register(PostCell.self, forCellReuseIdentifier: "PostCell")
        
        view.addSubview(postsList)
        
        postsList.topAnchor.constraint(equalTo: header.bottomAnchor, constant: 10).isActive = true
        postsList.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        postsList.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        postsList.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
    
    private func setupHeader() {
        view.addSubview(header)
        
        header.topAnchor.constraint(equalTo: view.topAnchor, constant: 38).isActive = true
        header.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        header.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        
        header.onClikAdd = {
            print("onClikAdd")
        }
        
        header.onClikComment = {
            print("onClikComment")
        }
        
        header.onClikShare = {
            print("onClikShare")
        }
    }
}

#if canImport(SwiftUI) && DEBUG
import SwiftUI
struct FeedListPreview_Previews: PreviewProvider {
    static var previews: some View {
        UIViewControllerPreview {
            FeedViewController()
        }.preferredColorScheme(.light)
    }
}
#endif

