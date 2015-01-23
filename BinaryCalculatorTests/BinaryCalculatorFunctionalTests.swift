//
//  BinaryCalculatorFunctionalTests.swift
//  BinaryCalculator
//
//  Created by Bryan Smith on 1/11/15.
//  Copyright (c) 2015 Bryan Smith. All rights reserved.
//

import UIKit
import XCTest
import BinaryCalculator

class BinaryCalculatorFunctionalTests: XCTestCase {
    
    var viewController:ViewController?

    override func setUp() {
        let app = UIApplication.sharedApplication().delegate as AppDelegate
        viewController = app.window!.rootViewController as ViewController?
    }

    func testThatTheUIDisplaysTheBuffer() {
        
        // Given
        let vc = viewController!
        let display = vc.display()
        
        // When
        vc.press1(self)
        vc.press1(self)
        vc.press0(self)
        
        // Then
        if let text = display.text {
            XCTAssertEqual(text, "110")
        } else {
            XCTFail("No text for label")
        }
        
    }
    
    func testThatTheUICanAnd() {
        
        // Given
        let vc = viewController!
        let display = vc.display()
        
        vc.press1(self)
        vc.press1(self)
        vc.press0(self)
        
        // When
        vc.pressAnd(self)
        
        vc.press1(self)
        vc.press0(self)
        vc.press0(self)
        
        // Then
        if let text = display.text {
            XCTAssertEqual(text, "100")
        } else {
            XCTFail("No text for label")
        }
        
    }
    
    func testThatTheUICanClear() {
        
        // Given
        let vc = viewController!
        let display = vc.display()
        
        vc.press1(self)
        vc.press1(self)
        vc.press0(self)
        
        // When
        vc.pressClear(self)
        
        // Then
        if let text = display.text {
            XCTAssertEqual(text, "")
        } else {
            XCTFail("No text for label")
        }
        
    }

}
