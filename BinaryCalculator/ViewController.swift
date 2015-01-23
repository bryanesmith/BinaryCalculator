//
//  ViewController.swift
//  BinaryCalculator
//
//  Created by Bryan Smith on 12/28/14.
//  Copyright (c) 2014 Bryan Smith. All rights reserved.
//

import UIKit

public class ViewController: UIViewController {
    
    var calc = BinaryCalculatorModel()
    var isDecimal = false
    
    @IBOutlet var label : UILabel!
    
    private func updateUI() {
        var text = isDecimal ? calc.decimal() : calc.buffer()
        label.text = "\(text)"
    }
    
    @IBAction
    public func press0(sender:AnyObject) {
        calc.append("0")
        updateUI()
    }
    
    @IBAction
    public func press1(sender:AnyObject) {
        calc.append("1")
        updateUI()
    }
    
    @IBAction
    public func pressAnd(sender:AnyObject) {
        calc.binaryOperation { $0 & $1 }
    }
    
    @IBAction
    public func pressOr(sender:AnyObject) {
        calc.binaryOperation { $0 | $1 }
    }
    
    @IBAction
    public func pressClear(sender:AnyObject) {
        calc.clear()
        label.text = "0"
    }

    @IBAction
    public func pressEquals(sender:AnyObject) {
        calc.equals()
        updateUI()
    }
    
    @IBAction
    func toggleView(sender:AnyObject) {
        isDecimal != isDecimal
        updateUI()
    }
    
    public func display() -> UILabel {
        return self.label
    }
}

