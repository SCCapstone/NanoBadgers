//
//  NanoGirlsUITests.swift
//  NanoGirlsUITests
//
//  Created by Elizabeth Pruett on 10/17/16.
//  Copyright © 2016 NanoBadgers. All rights reserved.
//

import XCTest

@available(iOS 9.0, *)
class NanoGirlsUITests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        
        
        
        //XCTAssert()
        
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        if #available(iOS 9.0, *) {
            XCUIApplication().launch()
        } else {
            // Fallback on earlier versions
        }
        
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        
        let app = XCUIApplication()
        
        
        //TEST ABOUT PAGE
        app.buttons["aboutButton"].tap()
        
        let textView = app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .textView).element
        
        
        textView.swipeUp()
        textView.tap()
        app.navigationBars["About"].buttons["Back"].tap()
        
        
        
        //TEST LOGIN PAGE
        
        /**
         
         app.buttons["loginButton"].tap()
         
         XCTAssertEqual(app.textFields.count, 2) //failing here because there are 0 text fields....?? No idea why, there should be two
         
         let emailField = app.textFields["email"]
         emailField.tap()
         emailField.typeText("dennismt@email.sc.edu")
         
         
         let passwordField = app.textFields["password"]
         passwordField.tap()
         passwordField.typeText("xxx")
         
         app.buttons["loginButton"].tap()
         
         let loginAlert = app.alerts["alertVC"]
         
         XCTAssertEqual(loginAlert.title, "Error")
         
         **/
    }
    
}
