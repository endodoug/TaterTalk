//
//  ChatCell.swift
//  TaterTalk
//
//  Created by doug harper on 3/17/16.
//  Copyright © 2016 Doug Harper. All rights reserved.
//

import UIKit

class ChatCell: UITableViewCell {
    
    let messageLabel: UILabel = UILabel()
    private let bubbleImageView = UIImageView()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // position Speech bubble and text in cell
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        bubbleImageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(bubbleImageView)
        bubbleImageView.addSubview(messageLabel)
        
        // center message in bubble
        messageLabel.centerXAnchor.constraintEqualToAnchor(bubbleImageView.centerXAnchor).active = true
        messageLabel.centerYAnchor.constraintEqualToAnchor(bubbleImageView.centerYAnchor).active = true
        
        // speech bubble grows with message
        bubbleImageView.widthAnchor.constraintEqualToAnchor(messageLabel.widthAnchor, constant: 50).active = true
        bubbleImageView.heightAnchor.constraintEqualToAnchor(messageLabel.heightAnchor).active = true
        
        // speech bubble to right side
        bubbleImageView.topAnchor.constraintEqualToAnchor(contentView.topAnchor).active = true
        bubbleImageView.trailingAnchor.constraintEqualToAnchor(contentView.trailingAnchor).active = true
        
        // set up message label
        messageLabel.textAlignment = .Center
        messageLabel.numberOfLines = 0
        
        // speech bubble image
        let image = UIImage(named: "MessageBubble")?.imageWithRenderingMode(.AlwaysTemplate)
        bubbleImageView.tintColor = UIColor.blueColor()
        bubbleImageView.image = image
        
        
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
