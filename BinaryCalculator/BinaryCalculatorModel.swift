//
//  BinaryCalculator.swift
//  BinaryCalculator
//
//  Created by Bryan Smith on 12/28/14.
//  Copyright (c) 2014 Bryan Smith. All rights reserved.
//

import Foundation

public class BinaryCalculatorModel {
    
    public typealias BinaryOperation = (Int, Int) -> Int
    
    var b:[Character] // buffer
    var r:[Character] // register
    var op:BinaryOperation?
    
    public init() {
        b  = [Character]()
        r  = [Character]()
    }
    
    public func clear() {
        b  = [Character]()
        r  = [Character]()
        op = nil
    }
    
    public func append(char:Character) {
        self.b.append(char)
    }
    
    public func buffer() -> String {
        return b.reduce("") { "\($0)\($1)" }
    }
    
    public func decimal() -> String {
        return String(parseBinary(buffer()))
    }
    
    private func moveToRegister() {
        if (!b.isEmpty) {
            r = b
            b = [Character]()
        }
    }
    
    public func binaryOperation(op:BinaryOperation) {
        self.op = op
        moveToRegister()
    }
    
    private func parseBinary(binary:String) -> Int {
        return Array(binary)
            .map { $0 == "0" ? 0 : 1 }
            .reduce(0) { $0 * 2 + $1 }
    }
    
    public func equals() {
        if let bop = op {
            let i1 = parseBinary(String(b))
            let i2 = parseBinary(String(r))
            let i3 = bop(i1, i2)
            b = Array(String(i3, radix:2))
            r = [Character]()
            op = nil
        }
    }
}

