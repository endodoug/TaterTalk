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
    
    private var messages = [Message]()
    private let cellIdentifier = "Cell"
    private let newMessageField = UITextView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        //allows the row height to be adjusted dynamically
        tableView.estimatedRowHeight = 44
        
        // Do any additional setup after loading the view, typically from a nib.
        
        // set up some fake data
        
        var localIncoming = true
        
        for i in 0...10 {           // loop thru 10x
            let m = Message()       // m = an instance of Message
            //m.text = String(i)      // m.text = i(count increment) as a string
            m.text = "This is a longer message."
            m.incoming = localIncoming
            localIncoming = !localIncoming
            messages.append(m)      // add m to messages array
        }
        
        for eachMessage in messages {
            print(eachMessage, ":", eachMessage.text)
        }
        
        // create new message area
        let newMessageArea = UIView()
        newMessageArea.backgroundColor = UIColor.lightGrayColor()
        newMessageArea.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(newMessageArea)
        
        newMessageField.translatesAutoresizingMaskIntoConstraints = false
        newMessageArea.addSubview(newMessageField)
        
        newMessageField.scrollEnabled = false
        
        let sendButton = UIButton()
        sendButton.translatesAutoresizingMaskIntoConstraints = false
        newMessageArea.addSubview(sendButton)
        
        sendButton.setTitle("Send", forState: .Normal)
        
        sendButton.setContentHuggingPriority(251, forAxis: .Horizontal)
        
        let newMessageAreaConstraints: [NSLayoutConstraint] = [
            newMessageArea.leadingAnchor.constraintEqualToAnchor(view.leadingAnchor),
            newMessageArea.trailingAnchor.constraintEqualToAnchor(view.trailingAnchor),
            newMessageArea.bottomAnchor.constraintEqualToAnchor(view.bottomAnchor),
            newMessageField.leadingAnchor.constraintEqualToAnchor(newMessageArea.leadingAnchor, constant: 10),
            newMessageField.centerYAnchor.constraintEqualToAnchor(newMessageArea.centerYAnchor),
            sendButton.trailingAnchor.constraintEqualToAnchor(newMessageArea.trailingAnchor, constant: -10),
            newMessageField.trailingAnchor.constraintEqualToAnchor(sendButton.leadingAnchor, constant: -10),
            sendButton.centerYAnchor.constraintEqualToAnchor(newMessageField.centerYAnchor),
            newMessageArea.heightAnchor.constraintEqualToAnchor(newMessageField.heightAnchor, constant: 20)
        ]
        
        NSLayoutConstraint.activateConstraints(newMessageAreaConstraints)
        
        
        // set up cell reuse
        tableView.registerClass(ChatCell.self, forCellReuseIdentifier: cellIdentifier)
        
        // start AutoLayout
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        
        // set up array of autolayout constraints for our tableView
        let tableViewConstraints: [NSLayoutConstraint] = [
            tableView.topAnchor.constraintEqualToAnchor(view.topAnchor),
            tableView.bottomAnchor.constraintEqualToAnchor(newMessageArea.topAnchor),
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

extension ChatViewController: UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! ChatCell
        let message = messages[indexPath.row]
        cell.messageLabel.text = message.text
        cell.incoming(message.incoming)
    // remove cell separator line
        cell.separatorInset = UIEdgeInsetsMake(0, tableView.bounds.size.width, 0, 0)
        return cell
    }
}

extension ChatViewController: UITableViewDelegate {
    func tableView(tableView: UITableView, shouldHighlightRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }
}














