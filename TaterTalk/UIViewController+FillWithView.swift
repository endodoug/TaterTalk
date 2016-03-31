//
//  UIViewController+FillWithView.swift
//  TaterTalk
//
//  Created by doug harper on 3/31/16.
//  Copyright © 2016 Doug Harper. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    func fillViewWith(subview: UIView) {
        subview.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(subview)
        
        let viewConstraints: [NSLayoutConstraint] = [
            subview.topAnchor.constraintEqualToAnchor(topLayoutGuide.topAnchor),
            subview.leadingAnchor.constraintEqualToAnchor(view.leadingAnchor),
            subview.trailingAnchor.constraintEqualToAnchor(view.trailingAnchor),
            subview.bottomAnchor.constraintEqualToAnchor(bottomLayoutGuide.topAnchor)
        ]
        
        NSLayoutConstraint.activateConstraints(viewConstraints)
    }
}
