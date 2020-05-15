//
//  Prototype.swift
//  Swift Tutorials
//
//  Created by Sedrick Cashaw Jr on 5/14/20.
//  Copyright © 2020 Sedrick Cashaw. All rights reserved.
//

import UIKit

// MARK: Prototype - Cloning objects (value and reference)
/* Saves time on create a object */


class Prototype: NSCopying {
    //Make a refence type being able to be copied
    func copy(with zone: NSZone? = nil) -> Any {
        return Prototype(firstName: self.firstName, lastName: self.lastName)
    }
    
    var firstName: String
    var lastName: String
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
    
    func clone() -> Prototype {
        return self.copy() as! Prototype
    }
}

extension Prototype:CustomStringConvertible {
    public var description: String {
        return "Hi, I am \(firstName) \(lastName)"
    }
}

//Use Prototype
//var steve = Prototype(firstName: "Steve", lastName: "Johnson")
//var tim = steve.clone()

