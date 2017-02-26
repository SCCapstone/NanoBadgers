//
//  HelloWorldTest.swift
//  NanoGirls
//
//  Created by Spencer Nelson on 2/1/17.
//  Copyright © 2017 NanoBadgers. All rights reserved.
//

import XCTest
import NanoGirls
class HelloWorldTest: XCTestCase {
    
    func testViewDidLoad(){
        let v = HomePageViewController()
        
        XCTAssertNotNil(v.view, "View Did Not Load")
    }
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
    
}
