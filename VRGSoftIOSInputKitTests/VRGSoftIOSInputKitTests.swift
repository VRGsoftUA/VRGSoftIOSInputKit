//
//  VRGSoftIOSInputKitTests.swift
//  VRGSoftIOSInputKitTests
//
//  Created by developer on 06.03.2020.
//  Copyright © 2020 OLEKSANDR SEMENIUK. All rights reserved.
//

import XCTest
import VRGSoftIOSInputKit

class VRGSoftIOSInputKitTests: XCTestCase {

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testFormattedDigitsSimple_correct() {
        
        let inputString: String = "3806331958129"
        
        let formatter = createSUT(formaters: ["+ ##(###) ###-####"])
        let formattedString: String = formatter.formattedStringFormString(originalStr: inputString)
        
        XCTAssertEqual(formattedString, "+ 38(063) 319-5812")
    }
    
    private func createSUT(formaters: [String]) -> SMFormatterDigitSimple {
        let formatter: SMFormatterDigitSimple = .init(formaters: formaters)
        return formatter
    }
}
