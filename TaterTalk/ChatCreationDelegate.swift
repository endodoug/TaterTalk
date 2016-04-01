//
//  ChatCreationDelegate.swift
//  TaterTalk
//
//  Created by doug harper on 3/31/16.
//  Copyright © 2016 Doug Harper. All rights reserved.
//

import Foundation
import CoreData

protocol ChatCreationDelegate {
    func created(chat chat: Chat, inContext context: NSManagedObjectContext)
}