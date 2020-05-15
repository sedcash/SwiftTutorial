//
//  Proxy.swift
//  Swift Tutorials
//
//  Created by Sedrick Cashaw Jr on 5/14/20.
//  Copyright © 2020 Sedrick Cashaw. All rights reserved.
//

import Foundation

// MARK: Proxy - Cloaks an object and postpones time-consuming operations until they are needed
/*
 Povides additional level of access: controlled, remote, delay
 -Delay creation: delay object creation until first access. Example laxy variables
 -Local placeholder for remote resources - Batch new work calls or return cached values
 -Protective - ensure caller has permission to access the method
 Avoid: Proxied type but not be exposed to client, client having access to proxy types
 lazy properties are not tread safe, because it can initlized many times
 */

class RandomIntWitthID {
    var value: Int = {
        print("value initalized")
        return Int.random(in: Int.min...Int.max)
    }()
    
    lazy var uid: String = {
        print("uid initalized")
        return UUID().uuidString
    }()
}
