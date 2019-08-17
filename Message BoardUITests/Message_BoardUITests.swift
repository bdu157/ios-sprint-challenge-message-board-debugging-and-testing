//
//  Message_BoardUITests.swift
//  Message BoardUITests
//
//  Created by Spencer Curtis on 9/14/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest

class Message_BoardUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()

        // KEEP THIS SETUP FUNCTION EXACTLY AS IS.
        
        continueAfterFailure = false
        
        let app = XCUIApplication()
        
        app.launchArguments = ["UITesting"]
        app.launch()
    }
    
    //helper
    var app: XCUIApplication {
        return XCUIApplication()
    }

    private var input: String {
        return "first"
    }
    
    private var addButton: XCUIElement {
        return app.navigationBars.buttons["Add"]
    }
    
    private var title: XCUIElement {
        return app.navigationBars["New Message"]
    }
    
    private var senderLabel: XCUIElement {
        return app.staticTexts["MessageThreadDetailTableViewController.SenderLabel"]
    }
    
    private var contentLabel: XCUIElement {
        return app.staticTexts["MessageThreadDetailTableViewController.ContentLabel"]
    }
    
    private var contentTextView: XCUIElement {
        return app.textViews["MessageDetailViewController.TextView"]
    }
    
    
    private var sendButton: XCUIElement {
        return app.navigationBars.buttons["Send"]
    }
    
    private var backButton: XCUIElement {
        return app.navigationBars.buttons[input]
    }
    
    
    func testCreateThread() {
        
        let textField = app.textFields["Create a new thread:"]
        textField.tap()
        textField.typeText(input)
        app.keyboards.buttons["Return"].tap()
        XCTAssert(app.staticTexts[input].exists)
    }
    
    func testSegueAndTitle() {
        
        let textField = app.textFields["Create a new thread:"]
        textField.tap()
        textField.typeText(input)
        app.keyboards.buttons["Return"].tap()
        XCTAssert(app.staticTexts[input].exists)
        
        app.tables.staticTexts[input].tap()
        XCTAssert(app.navigationBars[input].exists)
    }
    
    func testAddButton() {
        let textField = app.textFields["Create a new thread:"]
        textField.tap()
        textField.typeText(input)
        app.keyboards.buttons["Return"].tap()
        XCTAssert(app.staticTexts[input].exists)
        
        app.tables.staticTexts[input].tap()
        XCTAssert(app.navigationBars[input].exists)
        
        let button = addButton
        button.tap()
        XCTAssert(title.exists)
        XCTAssert(sendButton.isHittable)
    }
    
    func testBackButton() {
        let textField = app.textFields["Create a new thread:"]
        textField.tap()
        textField.typeText(input)
        app.keyboards.buttons["Return"].tap()
        XCTAssert(app.staticTexts[input].exists)
        
        app.tables.staticTexts[input].tap()
        XCTAssert(app.navigationBars[input].exists)
        
        let button = addButton
        button.tap()
        XCTAssert(title.exists)
        XCTAssert(sendButton.isHittable)
        
        backButton.tap()
        XCTAssert(app.navigationBars[input].exists)
    }
    
    func testCreateMessage() {
        let textField = app.textFields["Create a new thread:"]
        textField.tap()
        textField.typeText(input)
        app.keyboards.buttons["Return"].tap()
        XCTAssert(app.staticTexts[input].exists)
        
        app.tables.staticTexts[input].tap()
        XCTAssert(app.navigationBars[input].exists)
        
        let button = addButton
        button.tap()
        XCTAssert(title.exists)
        XCTAssert(sendButton.isHittable)
        
        let messageTextField = app.textFields["Enter your name:"]
        messageTextField.tap()
        messageTextField.typeText("dongwoo")
//        let textView = app.textViews["MessageDetailViewController.TextView"]
//        textView.tap()
//        contentTextView.typeText("anything")
        sendButton.tap()
        
        //XCTAssertEqual(senderLabel.label, "dongwoo")
        //XCTAssert(contentLabel.staticTexts["anything"].exists)
        //XCTAssert(title.exists)
    }
    
}
