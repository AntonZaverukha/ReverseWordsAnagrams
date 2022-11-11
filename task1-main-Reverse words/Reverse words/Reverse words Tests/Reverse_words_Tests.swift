//
//  Reverse_words_Tests.swift
//  Reverse words Tests
//
//  Created by Антон Заверуха on 31.05.2022.
//  Copyright © 2022 Антон Заверуха. All rights reserved.
//

import XCTest
@testable import Reverse_words

class Reverse_words_Tests: XCTestCase {
    
    var reverse: Reverse!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        reverse = Reverse()
    }
    
    override func tearDownWithError() throws {
        reverse = nil
        try super.tearDownWithError()
    }
    
    func testStringInputAndExpectedOutput() throws {
        let inputString = "Test string"
        let resultString = reverse.reverseWords(sentence: inputString)
        XCTAssertEqual(resultString, "tseT gnirts")
    }
    
    func testEmptyStringInput() throws {
        let inputString = ""
        let resultString = reverse.reverseWords(sentence: inputString)
        XCTAssertEqual(resultString, "")
    }
    
    func testLongStringInput() throws {
        let inputString = "A long string for test. A long string for test. A long string for test. A long string for test."
        let resultString = reverse.reverseWords(sentence: inputString)
        XCTAssertEqual(resultString, "A gnol gnirts rof .tset A gnol gnirts rof .tset A gnol gnirts rof .tset A gnol gnirts rof .tset")
    }
    
    func testPunctuationAndSpecialCharactersInput() throws {
        let inputString = "Check-= spec1@l /character/s, and !punctuation:."
        let resultString = reverse.reverseWords(sentence: inputString)
        XCTAssertEqual(resultString, "=-kcehC l@1ceps ,s/retcarahc/ dna .:noitautcnup!")
    }
    
    func testWhitespacesStringInput() throws {
        let inputString = "T e st ST ri ng"
        let resultString = reverse.reverseWords(sentence: inputString)
        XCTAssertEqual(resultString, "T e ts TS ir gn")
    }
    
    func testDefaultReverseInputOutput() throws {
        let inputString = "Foxminded cool 24/7 abcd efgh a1bcd efg!h"
        let resultString = reverse.reverseDefault(inputString)
        XCTAssertEqual(resultString, "dednimxoF looc 24/7 dcba hgfe d1cba hgf!e")
    }
    
    func testCustomReverseInputOutput() throws {
        let inputString = "Foxminded cool 24/7 abcd efgh a1bcd efglh"
        let rules = "xl"
        let resultString = reverse.reverseCustom(inputString, rules)
        XCTAssertEqual(resultString, "dexdnimoF oocl 7/42 dcba hgfe dcb1a hgfle")
    }
    
    func testFoxmindedRule() throws {
        let inputString = "Foxminded cool 24/7"
        let rules = "Foxminded"
        let resultString = reverse.reverseCustom(inputString, rules)
        XCTAssertEqual(resultString, "Foxminded looc 7/42")
    }
    
    func testSpecialCharactersRule() throws {
        let inputString = "F0xm1nded c00l 24/7"
        let rules = "10/"
        let resultString = reverse.reverseCustom(inputString, rules)
        XCTAssertEqual(resultString, "d0ed1nmxF l00c 74/2")
    }
}

