//
//  Swift_TutorialsTests.swift
//  Swift TutorialsTests
//
//  Created by Yesha Lester on 5/14/20.
//  Copyright © 2020 Sedrick Cashaw. All rights reserved.
//

import XCTest
@testable import Swift_Tutorials

class Swift_TutorialsTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testConcurrencyForSingelton() {
        let concurrentQueue = DispatchQueue(label: "concurrentQueue", attributes: .concurrent)
        
        let expect = expectation(description: "Using Singleton.shared from multiple threas shall succeed")
        
        let callCount = 100
        
        for callIndex in 1...callCount {
            concurrentQueue.async {
                Singleton.shared.set(value: callIndex, forKey: String(callIndex))
            }
        }
            while Singleton.shared.int(forKey: String(callCount)) != callCount {
                // do nothing
            }
        
        expect.fulfill()
        
        waitForExpectations(timeout: 5, handler: { (error) in
            XCTAssertNil(error, "Test expectation failed")
            
        })
    }
    
}
