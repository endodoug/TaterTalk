//
//  Contact.swift
//  TaterTalk
//
//  Created by doug harper on 3/26/16.
//  Copyright © 2016 Doug Harper. All rights reserved.
//

import Foundation
import CoreData


class Contact: NSManagedObject {

    var sortLetter: String {
        let letter = lastName?.characters.first ?? firstName?.characters.first
        let s = String(letter!)
        return s
    }
    
    var fullName: String {
        var fullName = ""
        if let firstName = firstName {
            fullName += firstName
        }
        if let lastName = lastName {
            if fullName.characters.count > 0 {
                fullName += " "
            }
            fullName += lastName
        }
        return fullName
    }

}
