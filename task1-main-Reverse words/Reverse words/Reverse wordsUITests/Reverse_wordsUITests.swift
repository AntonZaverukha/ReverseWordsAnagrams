//
//  Reverse_wordsUITests.swift
//  Reverse wordsUITests
//
//  Created by Антон Заверуха on 31.05.2022.
//  Copyright © 2022 Антон Заверуха. All rights reserved.
//

import XCTest

class Reverse_wordsUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testStringInputAndResultCheck() throws {
        let app = XCUIApplication()
        let inputTextField = app.textFields["inputField"]
        let resultLabel = app.staticTexts["resultLabel"]
        let reverseButton = app.buttons["reverseButton"]
        let infoLabel = app.staticTexts["infoLabel"]
        app.launch()
        
        inputTextField.tap()
        inputTextField.typeText("Test string")
        infoLabel.tap()
        reverseButton.tap()
        XCTAssert(resultLabel.exists)
    }
    
    func testDefaultInputAndResult() throws {
        let app = XCUIApplication()
        let inputTextField = app.textFields["inputField"]
        let resultLabel = app.staticTexts["resultLabel"]
        let reverseButton = app.buttons["reverseButton"]
        let infoLabel = app.staticTexts["infoLabel"]
        let reverseSegment = app.segmentedControls["reverseSegments"]
        app.launch()
        
        reverseSegment.buttons["Default"].tap()
        inputTextField.tap()
        inputTextField.typeText("Foxminded cool 24/7 abcd efgh a1bcd efg!h")
        infoLabel.tap()
        reverseButton.tap()
        XCTAssert(resultLabel.exists)
    }
    
    func testCustomInputAndResult() throws {
        let app = XCUIApplication()
        let inputTextField = app.textFields["inputField"]
        let resultLabel = app.staticTexts["resultLabel"]
        let reverseButton = app.buttons["reverseButton"]
        let infoLabel = app.staticTexts["infoLabel"]
        let reverseSegment = app.segmentedControls["reverseSegments"]
        let rulesField = app.textFields["rulesField"]
        app.launch()
        
        reverseSegment.buttons["Custom"].tap()
        inputTextField.tap()
        inputTextField.typeText("Foxminded cool 24/7 abcd efgh a1bcd efglh")
        rulesField.tap()
        rulesField.typeText("Foxminded 24/7")
        infoLabel.tap()
        infoLabel.tap()
        reverseButton.tap()
        XCTAssert(resultLabel.exists)
    }
}
    


