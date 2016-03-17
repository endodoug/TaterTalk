//
//  ViewController.swift
//  TaterTalk
//
//  Created by doug harper on 3/17/16.
//  Copyright © 2016 Doug Harper. All rights reserved.
//

import UIKit

class ChatViewController: UIViewController {
    
    private let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        
        //: set up array of autolayout constraints for our tableView
        let tableViewConstraints: [NSLayoutConstraint] = [
            tableView.topAnchor.constraintEqualToAnchor(view.topAnchor),
            tableView.bottomAnchor.constraintEqualToAnchor(view.bottomAnchor),
            tableView.rightAnchor.constraintEqualToAnchor(view.rightAnchor),
            tableView.leftAnchor.constraintEqualToAnchor(view.leftAnchor)
        ]
        
        //: activate all constraints 
        NSLayoutConstraint.activateConstraints(tableViewConstraints)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

