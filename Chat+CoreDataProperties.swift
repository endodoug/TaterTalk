//
//  Chat+CoreDataProperties.swift
//  TaterTalk
//
//  Created by doug harper on 3/31/16.
//  Copyright © 2016 Doug Harper. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Chat {

    @NSManaged var lastMessageTime: NSDate?
    @NSManaged var messages: NSSet?
    @NSManaged var participants: NSSet?

}
