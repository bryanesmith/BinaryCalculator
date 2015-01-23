//
//  BinaryCalculatorTests.swift
//  BinaryCalculatorTests
//
//  Created by Bryan Smith on 12/28/14.
//  Copyright (c) 2014 Bryan Smith. All rights reserved.
//

import UIKit
import XCTest
import BinaryCalculator

extension BinaryCalculatorModel {
    func appendAll(chars:[Character]) {
        for c in chars {
            append(c)
        }
    }
}

class BinaryCalculatorUnitTests: XCTestCase {
    
    func testThatCalculatorCanAnd() {
        
        // Given
        var calc = BinaryCalculatorModel()
        calc.appendAll([ "1", "1", "0"])
        
        // When
        calc.binaryOperation(&)
        calc.appendAll([ "0", "1", "1"])
        
        // Then
        calc.equals()
        XCTAssertEqual(calc.buffer(), "10")
    }
    
    func testThatCalculatorCanClear() {
        
        // Given
        var calc = BinaryCalculatorModel()
        calc.appendAll([ "1", "1", "0"])
        
        // When
        calc.clear()
        
        // Then
        XCTAssertEqual(calc.buffer(), "")
    }
    
}
