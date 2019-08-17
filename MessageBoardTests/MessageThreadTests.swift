//
//  MessageThreadTests.swift
//  MessageBoardTests
//
//  Created by Andrew R Madsen on 9/13/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest
@testable import Message_Board

class MessageThreadTests: XCTestCase {

    var messageThreadController: MessageThreadController {
        return MessageThreadController()
    }
    
    //checkifcreateThread and putting is working
    func testIfURLsessionWorks() {
        self.messageThreadController.createMessageThread(with: "random") {}
        XCTAssertNotNil(self.messageThreadController.messageThreads)  //it fails if you use XCTAssertNil so createMessageThread works
    }

    //checkifcreatemessageworks
    func testCreateMessage() {
        
        self.messageThreadController.createMessageThread(with: "random") {}
        guard let messageThread = self.messageThreadController.messageThreads.last else {return}
        self.messageThreadController.createMessage(in: messageThread, withText: "content", sender: "sender") {}
        XCTAssertNotNil(self.messageThreadController.messageThreads.last?.messages)
    }
    
    //checkfetchmessge
    func testFetchMessage(){
        self.messageThreadController.fetchMessageThreads {}
            XCTAssertNotNil(self.messageThreadController.messageThreads)
    }
}
