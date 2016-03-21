//
//  UITableView+Scroll.swift
//  TaterTalk
//
//  Created by doug harper on 3/20/16.
//  Copyright © 2016 Doug Harper. All rights reserved.
//

import Foundation
import UIKit

extension UITableView {
    func scrollToBottom() {
        self.scrollToRowAtIndexPath(NSIndexPath(forRow: self.numberOfRowsInSection(0)-1, inSection: 0), atScrollPosition: UITableViewScrollPosition.Bottom, animated: true)
    }
}