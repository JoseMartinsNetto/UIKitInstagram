//
//  UICollectionViewExtension.swift
//  InstaClone
//
//  Created by Jose Martins on 23/11/22.
//

import UIKit

extension UICollectionView {
    static func listLayout() -> UICollectionViewCompositionalLayout {
        var listConfiguration = UICollectionLayoutListConfiguration(appearance: .grouped)
        listConfiguration.showsSeparators = true
        listConfiguration.backgroundColor = .clear
        return UICollectionViewCompositionalLayout.list(using: listConfiguration)
    }
}
