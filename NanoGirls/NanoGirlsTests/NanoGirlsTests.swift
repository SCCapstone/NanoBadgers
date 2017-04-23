//
//  NanoGirlsTests.swift
//  NanoGirlsTests
//
//  Created by Elizabeth Pruett on 10/17/16.
//  Last Edited by Spencer Nelson on 2/1/2017.
//  Copyright © 2016 NanoBadgers. All rights reserved.
//

import XCTest
@testable import NanoGirls

class NanoGirlsTests: XCTestCase {
    
    func testViewDidLoad(){
        
        
    }
    
    override func setUp() {
        super.setUp()
        
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testHomePage()
    {
        let v = HomePageViewController()
        XCTAssertNotNil(v.view, "View Did Not Load")
    }
    
    func testLoginPage()
    {
        let x = LoginPageViewController()
        
        //test if page loads
        XCTAssertNotNil(x.view, "View Did Not Load")
        
        //test if refresh function works
        x.refresh()
        
    }
    
    func testLevelsPage()
    {
        let l = LevelViewController()
        
        XCTAssertNotNil(l.view, "View Did Not Load")
        
    }
    
    func testOriginStoryPage()
    {
        let o = OriginStoryViewController()
        
        XCTAssertNotNil(o.view, "View Did Not Load")
        
    }
    
    
    func testGamePage()
    {
        let t = MiniGame2ViewControllerLevel3()
        
        XCTAssertNotNil(t.view, "View Did Not Load")
        
        
    }
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        testHomePage()
        testLoginPage()
        
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
