//
//  Singleton.swift

import UIKit

// MARK: Singleton - Ensures only one instance of a type
/* Access and manage a single resource throughout app. Example: UIApplication, log file handler. Each type should have a single defined responsibility
 Avoid: Using the singleton as a global multipurpose container, not forgeting what dependency uses it, synchronization due to concurreny
 */

//create Singleton
final public class Singleton {
    public static let shared = Singleton()
    private let concurrentQueue = DispatchQueue(label: "concurrentQueue", attributes: .concurrent)
    private var settings: [String:Any] = ["Theme": "Dark", "MaxDownloads": 4]
    private init() {}
    
    
    public func string(forKey key: String) -> String? {
        var result: String?
        
        concurrentQueue.sync {
            result = settings[key] as? String
        }
        return result
    }
    
    public func int(forKey key: String) -> Int? {
        var result: Int?
        
        concurrentQueue.sync {
            result = settings[key] as? Int
        }
        return result
    }
    
    public func set(value: Any, forKey key: String) {
        concurrentQueue.async(flags: .barrier){
            self.settings[key] = value
        }
    }
}
//use Singleton
//let maxDownloads = Singleton.shared.int(forKey: "MaxDownloads")



