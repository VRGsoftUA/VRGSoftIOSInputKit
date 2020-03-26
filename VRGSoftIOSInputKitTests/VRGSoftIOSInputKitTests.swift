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
    
    func testFormatter_withOriginal() {
        
        let inputString: String = "380633116310f"
        
        let formatter = createSUTFormatter(mask: "+ XX(XXX) XXX-XX-XX")
        let result: String = formatter.formatter(originalString: inputString)!

        XCTAssertEqual(result, "+ 38(063) 311-63-10")
    }
    
    func testFormatter_withEditing() {
        
        let inputString: String = "+ 38(063) 200-42-99"
        
        let formatter = createSUTFormatter(mask: "+ XX(XXX) XXX-XX-XX")
        let result: String = formatter.formatter(forText: inputString, shouldChangeCharactersInRange: .init(), replacementString: "")

        XCTAssertEqual(result, "+ 38(063) 200-42-99")
    }
    
    private func createSUTFormatter(mask: String) -> SMFormatter {
        
        let formatter: SMFormatter = .init(with: mask)
        return formatter
    }
}
