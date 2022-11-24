//
//  TabbarViewController.swift
//  InstaClone
//
//  Created by Jose Martins on 22/11/22.
//

import UIKit

enum TabType: Int {
    case home = 0
    case search = 1
    case media = 3
    case shop = 4
    case user = 5
}

final class TabbarViewController: UIViewController {
    static let shared = TabbarViewController()
    
    private let homeButton: UIButton = .iconButton(icon: .iconHome, iconColor: .white, tag: 0)
    private let searchButton: UIButton = .iconButton(icon: .iconSearch, iconColor: .defaultIconColor, tag: 1)
    private let mediaButton: UIButton = .iconButton(icon: .iconMedia, iconColor: .defaultIconColor, tag: 2)
    private let shopButton: UIButton = .iconButton(icon: .iconShop, iconColor: .defaultIconColor, tag: 3)
    private let userButton: UIButton = .userButton(icon: .postExemple, tag: 4)
    
    private let containerView = UIView(disableAutoResizing: true)
    private let tabView = UIStackView(disableAutoResizing: true)
    
    private(set) var currentViewController: UIViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        setupTabView()
        setupContainerView()
        loadSubcontroller()
        setupButtonActions()
    }
    
    private func loadSubcontroller(viewTag: Int = 0) {
        guard let tabType = TabType(rawValue: viewTag) else { return }
        
        var navController: UIViewController!
        
        switch tabType {
        case .home:
            navController = UINavigationController(rootViewController: FeedViewController())
            break
        case .search:
            navController = UINavigationController(rootViewController: FeedViewController())
            break
        case .media:
            navController = UINavigationController(rootViewController: FeedViewController())
            break
        case .shop:
            navController = UINavigationController(rootViewController: FeedViewController())
            break
        case .user:
            navController = UINavigationController(rootViewController: FeedViewController())
            break
        }
        
        navController.view.frame = containerView.frame
        
        currentViewController?.willMove(toParent: nil)
        currentViewController?.view.removeFromSuperview()
        
        addChild(navController)
        
        currentViewController?.removeFromParent()
        
        containerView.addSubview(navController.view)
        navController.didMove(toParent: self)
        
        currentViewController = navController
    }
    
    private func setupContainerView() {
        view.addSubview(containerView)
        
        containerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: tabView.topAnchor).isActive = true
        containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
    
    private func setupTabView() {
        tabView.addArrangedSubviews([homeButton, searchButton, mediaButton, shopButton])
        tabView.distribution = .fillEqually
        tabView.alignment = .center
        tabView.axis = .horizontal
        tabView.translatesAutoresizingMaskIntoConstraints = false
        tabView.addBorders(edges: [.top], color: .lightBlackDarkWhite)
        
        view.addSubview(tabView)
        
        tabView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tabView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tabView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tabView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        view.layoutIfNeeded()
    }
    
    private func setupButtonActions() {
        homeButton.addTarget(self, action: #selector(handleTabButtonsTap), for: .touchUpInside)
        searchButton.addTarget(self, action: #selector(handleTabButtonsTap), for: .touchUpInside)
        mediaButton.addTarget(self, action: #selector(handleTabButtonsTap), for: .touchUpInside)
        shopButton.addTarget(self, action: #selector(handleTabButtonsTap), for: .touchUpInside)
        userButton.addTarget(self, action: #selector(handleTabButtonsTap), for: .touchUpInside)
    }
    
    @objc private func handleTabButtonsTap(_ sender: UIButton) {
        homeButton.tintColor = sender.tag == 0 ? .lightBlackDarkWhite : .defaultIconColor
        searchButton.tintColor = sender.tag == 1 ? .lightBlackDarkWhite : .defaultIconColor
        mediaButton.tintColor = sender.tag == 2 ? .lightBlackDarkWhite : .defaultIconColor
        shopButton.tintColor = sender.tag == 3 ? .lightBlackDarkWhite : .defaultIconColor
        
        loadSubcontroller(viewTag: sender.tag)
        
        view.layoutIfNeeded()
    }
    
}

#if canImport(SwiftUI) && DEBUG
import SwiftUI
struct TabbarPreview_Previews: PreviewProvider {
    static var previews: some View {
        UIViewControllerPreview {
            TabbarViewController()
        }
        .preferredColorScheme(.dark)
        
        UIViewControllerPreview {
            TabbarViewController()
        }
        .preferredColorScheme(.light)
    }
}

#endif
