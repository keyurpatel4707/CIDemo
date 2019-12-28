//
//  CIDemoTests.swift
//  CIDemoTests
//
//  Created by Keyur Patel on 28/12/19.
//  Copyright © 2019 3Embed. All rights reserved.
//

import XCTest
@testable import CIDemo

class CIDemoTests: XCTestCase {
    
    var email1: String?
    var password1: String?
    
    var email2: String?
    var password2: String?

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        email1 = "abc"
        password1 = "123"
        email2 = "abc@abc.com"
        password2 = "ABCabc@123"
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        if let email1 = email1, let password1 = password1 {
            XCTAssertFalse(email1.isValidEmail(), "Email-Id is not valid")
            XCTAssertFalse(password1.isValidPassword(), "Passord is not valid")
        }
        if let email2 = email2, let password2 = password2 {
            XCTAssertTrue(email2.isValidEmail(), "Email-Id is valid")
            XCTAssertTrue(password2.isValidPassword(), "Passord is valid")
        }
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
}
