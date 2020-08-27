//
//  CalculatorScreen.swift
//  ios-calculatorUITests
//
//  Created by Ripunjaya Saran on 8/26/20.
//  Copyright © 2020 enjelhutasoit. All rights reserved.
//

import Foundation
import XCTest

class CalculatorScreen: XCTestCase {
    
    let app = XCUIApplication()
    
    
    func tapButton(buttonText: String) {
        let element = app.buttons[buttonText].firstMatch
        element.tap()
    }
    
    /**
     * Performs operation between two numbers based on the type of arithmetic operation desired
     */
    func performOperation(firstNumber: Int, arithmeticOperation: String, secondNumber: Int) {
        tapButton(buttonText: String(firstNumber))
        tapButton(buttonText: arithmeticOperation)
        tapButton(buttonText: String(secondNumber))
        tapButton(buttonText: "=")
    }
}
