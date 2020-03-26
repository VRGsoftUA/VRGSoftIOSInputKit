//
//  VRGSoftIOSFilterTests.swift
//  VRGSoftIOSInputKitTests
//
//  Created by developer on 26.03.2020.
//  Copyright © 2020 OLEKSANDR SEMENIUK. All rights reserved.
//

import XCTest
import VRGSoftIOSInputKit

class VRGSoftIOSFilterTests: XCTestCase {
    
    func testFilter() {
        
        let inputString: String = """
Shewing met parties gravity husband sex pleased.
On to no kind do next feel held walk.
Last own loud and knew give gay four.
Sentiments motionless or principles preference excellence am.
Literature surrounded insensible at indulgence or to admiration remarkably.
Matter future lovers desire marked boy use. Chamber reached do he nothing be.
"""
        
        let filter: SMMaxLengthFilter = createSUTFilter(maxLengthText: 100)
        let result: String = filter.filter(inputString)
        
        XCTAssertEqual(result, """
Shewing met parties gravity husband sex pleased.
On to no kind do next feel held walk.
Last own loud
""")
    }
    
    func testFilterWithRange() {

        let inputString: String = "Detract yet delight written farther his general."

        let filter: SMMaxLengthFilter = createSUTFilter(maxLengthText: 100)
        let result: String = filter.filter(inputString, range: .init(location: 8, length: 3), replacementText: "blablabla")

        XCTAssertEqual(result, "Detract blablabla delight written farther his general.")
    }
    
    func testDecimalFilter() {
        
        let inputString: String = "Detract 1223 delight written farther his general."

        let filter: SMFilterDecimal = createSUTDecimalFilter()
        let result: String = filter.filter(inputString)

        XCTAssertEqual(result, "1223")
    }
    
    func testAllowedCharacters() {
        
        let inputString: String = "Detract 1223 delight written farther his general."

        let filter: SMFilterCharacters = createSUTAllowedFilter(allowedCharacters: "detract")
        let result: String = filter.filter(inputString)

        XCTAssertEqual(result, "etractdetrtteartereera")
    }
    
    private func createSUTFilter(maxLengthText: Int) -> SMMaxLengthFilter {
        
        let filter: SMMaxLengthFilter = .init(maxLengthText: maxLengthText)
        return filter
    }
    
    private func createSUTAllowedFilter(allowedCharacters: String) -> SMFilterCharacters {
        let filter: SMFilterCharacters = .init(allowedCharacters: allowedCharacters)
        return filter
    }
    
    private func createSUTDecimalFilter() -> SMFilterDecimal {
        let filter: SMFilterDecimal = SMFilterDecimal()
        return filter
    }
}

