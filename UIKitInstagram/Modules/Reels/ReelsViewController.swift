//
//  ReelsViewController.swift
//  InstaClone
//
//  Created by Jose Martins on 25/11/22.
//

import UIKit

final class ReelsViewController: InstaViewController {
    
}


#if canImport(SwiftUI) && DEBUG
import SwiftUI

struct ReelsPreview_Previews: PreviewProvider {
    static var previews: some View {
        UIViewControllerPreview {
            ReelsViewController()
        }
        .preferredColorScheme(.dark)
        
        UIViewControllerPreview {
            ReelsViewController()
        }
        .preferredColorScheme(.light)
    }
}

#endif
