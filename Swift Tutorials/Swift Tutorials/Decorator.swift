//
//  Decorator.swift
//  Swift Tutorials

import Foundation

// MARK: Decorator - Enhances existing types without changing their source code
//Avoid: Violating the Single Responsibilty Principle

//create Object wrapper
class UserDefaultsDecorator: UserDefaults {
    private var userDefaults = UserDefaults.standard
    
    convenience init(userDefaults: UserDefaults) {
        self.init()
        self.userDefaults = userDefaults
    }
    
    override func set(date: Date?, forKey key: String) {
        userDefaults.set(date, forKey: key)
    }
    
    override func date(forKey key: String) -> Date? {
        return userDefaults.value(forKey: key) as? Date
    }
}

//Using Extensions
extension UserDefaults {
    func set(date: Date?, forKey key: String) {
        self.set(date, forKey: key)
    }
    
    func date(forKey key: String) -> Date? {
        return self.value(forKey: key) as? Date
    }
}

