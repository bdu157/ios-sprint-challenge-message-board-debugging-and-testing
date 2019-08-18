//
//  Message_BoardUITests.swift
//  Message BoardUITests
//
//  Created by Spencer Curtis on 9/14/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest

class Message_BoardUITests: XCTestCase {
    
    
    var app: XCUIApplication {
        return XCUIApplication()
    }
    
    override func setUp() {
        super.setUp()

        // KEEP THIS SETUP FUNCTION EXACTLY AS IS.
        
        continueAfterFailure = false
        
        let app = XCUIApplication()
        
        app.launchArguments = ["UITesting"]
        app.launch()
    }
    
    //helper
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
    
    func testCreateMessages() {
        
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
        
//        let myTextView = app.textViews["myTextView"]
//        myTextView.tap()
//        myTextView.typeText("anything")
        
        let textView = app.otherElements.containing(.navigationBar, identifier:"New Message").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .textView).element
        textView.tap()
        textView.typeText("anything")
        
        sendButton.tap()
        XCTAssertEqual(senderLabel.label, "dongwoo")
        XCTAssertEqual(contentLabel.label, "anything")
        XCTAssert(app.navigationBars[input].exists)
    }
    
}
