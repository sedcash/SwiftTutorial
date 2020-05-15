//
//  FactoryMethod.swift
//  Swift Tutorials
//
//  Created by Sedrick Cashaw Jr on 5/14/20.
//  Copyright © 2020 Sedrick Cashaw. All rights reserved.
//

import UIKit

// MARK: Factory Method - Create objects without exposing its type to the caller
/* You can change the inside code without having to worry about the caller. Limited to tyoes that share a common protocol or superclass
 Avoid: Using protocol conferments to types that have different responsibilites just for the sake of the factory method design pattern
 */

protocol Factory {
    func create()
}

struct FactoryMethod {
    static func makeFactory(_ type: Factories) -> Factory? {
        let result: Factory?
        switch type {
        case .clothes:
            result = ClothesFactory()
        case .food:
            result = FoodFactory()
        case .game:
            result = GameFactory()
        }
        return result
    }
}

class ClothesFactory: Factory {
    func create() {
        print("Creating clothes")
    }
}

class FoodFactory: Factory {
    func create() {
        print("Creating food")
    }
}

class GameFactory: Factory {
    func create() {
        print("Creating game")
    }
}

enum Factories {
    case clothes
    case food
    case game
}

//Use FactoryMethod
//let clothesFactory = FactoryMethod.makeFactory(.clothes)
//clothesFactory?.create()
