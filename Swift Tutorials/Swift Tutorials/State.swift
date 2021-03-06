//
//  State.swift
//  Swift Tutorials
//
//  Created by Sedrick Cashaw Jr on 5/14/20.
//  Copyright © 2020 Sedrick Cashaw. All rights reserved.
//

import Foundation
// MARK: State - Replaces complex conditional logic with an object-oriented state machine
//Avoid: Exposing the state to the client,

fileprivate protocol CoffeeMachineState {
    func isReadyToBrew() -> Bool
    func brew()
}

extension CoffeeMachineState {
    func isReadyToBrew() -> Bool {
        print("\(#function) not implemented for \(self) state")
        return false
    }
    
    func brew() {
        print("\(#function) not implemented for \(self) state")
    }
}

fileprivate struct StandbyState: CoffeeMachineState {
    
}

fileprivate struct FillWaterTankState: CoffeeMachineState {
    var context: CoffeeMachine
    
    func isReadyToBrew() -> Bool {
        guard context.isWaterTankFilled else {
            print("Fill water tank!")
            context.state = StandbyState()
            return false
        }
        context.state = EmptyCapsuleBinState(context: context)
        return context.state.isReadyToBrew()
    }
}

fileprivate struct EmptyCapsuleBinState: CoffeeMachineState {
    var context: CoffeeMachine
    
    func isReadyToBrew() -> Bool {
        guard context.isCapsuleBinEmpty else {
            print("Empty capsule bin tank!")
            context.state = StandbyState()
            return false
        }
        
        context.state = InsertCapsuleState(context: context)
        return context.state.isReadyToBrew()
    }
}

fileprivate struct InsertCapsuleState: CoffeeMachineState {
    var context: CoffeeMachine
    
    func isReadyToBrew() -> Bool {
        guard context.isCapsuleInserted else {
            print("Coffee capsule not inserted!")
            context.state = StandbyState()
            return false
        }
        
        return true
    }
}

fileprivate struct BrewCoffeeState: CoffeeMachineState {
    var context: CoffeeMachine
    
    func brew() {
        context.state = FillWaterTankState(context: context)
        guard context.state.isReadyToBrew() else {
            print("Something went wrong!")
            context.state = StandbyState()
            return
        }
        
        print("Coffee ready")
        context.state = StandbyState()
    }
}

class CoffeeMachine {
    fileprivate var isWaterTankFilled: Bool
    fileprivate var isCapsuleBinEmpty: Bool
    fileprivate var isCapsuleInserted: Bool
    
    fileprivate var state: CoffeeMachineState = StandbyState()
    
    required init(waterFilled: Bool, binEmpty: Bool, capsuleInserted: Bool) {
        isWaterTankFilled = waterFilled
        isCapsuleBinEmpty = binEmpty
        isCapsuleInserted = capsuleInserted
    }
    
    func brew() {
        state = BrewCoffeeState(context: self)
        state.brew()
    }
}

class CoffeeMachineBugProne {
    private var isWaterTankFilled: Bool
    private var isCapsuleBinEmpty: Bool
    private var isCapsuleInserted: Bool
    
    required init(waterFilled: Bool, binEmpty: Bool, capsuleInserted: Bool) {
        isWaterTankFilled = waterFilled
        isCapsuleBinEmpty = binEmpty
        isCapsuleInserted = capsuleInserted
    }
    
    private func isReadyToBrew() -> Bool {
        var result = false
        
        if isWaterTankFilled {
            if isCapsuleBinEmpty {
                if isCapsuleInserted {
                    result = true
                    print("Coffee brewed")
                }
                else {
                    print("Insert capsule!")
                }
            }
            else {
                print("Capsule bin full!")
            }
        } else {
            print("Fill water tank!")
        }
        
        return result
    }
    
    func brew() {
        guard isReadyToBrew() else {
            print("Can't make coffee")
            return
        }
        print("Coffee ready!")
    }
}

//Use State
/*
let coffeeMachine = CoffeeMachine(waterFilled: true, binEmpty: true, capsuleInserted: true)
coffeeMachine.brew()
*/
