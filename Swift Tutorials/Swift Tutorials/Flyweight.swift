//
//  Flyweight.swift
//  Swift Tutorials
//
//  Created by Sedrick Cashaw Jr on 5/14/20.
//  Copyright © 2020 Sedrick Cashaw. All rights reserved.
//

import UIKit

// MARK: Flyweight - Reduces memory usage by sharing common data between objects

/* Intrinsic state - can be shared, Extrinsic state - mutable state, can change across objects
 Example: SpaceShip class in a computer game. All ships will look the same (intrinsic) but they can change positions (extrinsic)
 Avoid: Having mulitple intrinsic state objects, use Singleton or class instead of value type, because it saves memory
 */

class SharedSpaceShipData {
    private let mesh: [Float]
    private let texture: UIImage?
    
    init(mesh: [Float], imageNamed name: String) {
        self.mesh = mesh
        self.texture = UIImage(named: name)
    }
}

class SpaceShip {
    private var position: (Float, Float, Float)
    private var intrinsicState: SharedSpaceShipData
    
    init(sharedData: SharedSpaceShipData, position: (Float, Float, Float) = (0, 0, 0)) {
        self.position = position
        self.intrinsicState = sharedData
    }
}


//Use Flyweight
/*
let fleetSize = 1000
var ships = [SpaceShip]()
var vertices = [Float](repeating: 0, count: 1000) // just a dummy array of floats

let sharedState = SharedSpaceShipData(mesh: vertices, imageNamed: "SpaceShip")

for _ in 0..<fleetSize {
    let ship = SpaceShip(sharedData: sharedState,
                         position: (Float.random(in: 1...100),
                                    Float.random(in: 1...100),
                                    Float.random(in: 1...100)))
    ships.append(ship)
}
*/

