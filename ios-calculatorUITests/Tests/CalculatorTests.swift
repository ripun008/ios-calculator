//
//  CalculatorTests.swift
//  ios-calculatorUITests
//
//  Created by Ripunjaya Saran on 8/26/20.
//  Copyright © 2020 enjelhutasoit. All rights reserved.
//

import XCTest

class CalculatorTests: CalculatorScreen {

    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
    }

    override func tearDownWithError() throws {
        super.tearDown()
    }

    func testAddNumbers() throws {
        let firstNumber = 7
        let secondNumber = 2
        performOperation(firstNumber: firstNumber, arithmeticOperation: "+", secondNumber: secondNumber)
        XCTAssertEqual(firstNumber + secondNumber, Int(app.staticTexts.firstMatch.label))
    }
    
    func testSubstractNumbers() throws {
        let firstNumber = 9
        let secondNumber = 7
        performOperation(firstNumber: firstNumber, arithmeticOperation: "-", secondNumber: secondNumber)
        XCTAssertEqual(firstNumber - secondNumber, Int(app.staticTexts.firstMatch.label))
    }
    
    func testMultiplyNumbers() throws {
        let firstNumber = 3
        let secondNumber = 4
        performOperation(firstNumber: firstNumber, arithmeticOperation: "x", secondNumber: secondNumber)
        XCTAssertEqual(firstNumber * secondNumber, Int(app.staticTexts.firstMatch.label))
    }
    
    func testDivideNumbers() throws {
        let firstNumber = 8
        let secondNumber = 2
        performOperation(firstNumber: firstNumber, arithmeticOperation: "/", secondNumber: secondNumber)
        XCTAssertEqual(firstNumber / secondNumber, Int(app.staticTexts.firstMatch.label))
    }

}
