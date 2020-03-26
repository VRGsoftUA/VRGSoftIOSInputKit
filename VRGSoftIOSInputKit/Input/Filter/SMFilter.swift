//
//  SMFilter.swift
//  SwiftKit
//
//  Created by OLEKSANDR SEMENIUK on 7/17/17.
//  Copyright © 2017 semenag01. All rights reserved.
//

import Foundation

public typealias SMFilteredBlock = ((String) -> ())?

public protocol SMFilterProtocol {
    func filter(_ sourceText: String) -> String
}

extension SMFilterProtocol {
    public func replaceText(_ sourceText: String, range aRange: NSRange, replacementText text: String) -> String? {
        
        guard let stringRange = Range(aRange, in: sourceText) else {
            return nil
        }

        let updatedText = sourceText.replacingCharacters(in: stringRange, with: text)
        
        return updatedText
    }
    
    public func filter(_ sourceText: String, range aRange: NSRange, replacementText aText: String) -> String {
        
        if let updatedText: String = replaceText(sourceText, range: aRange, replacementText: aText) {
            
            return filter(updatedText)
        } else {
            
            return sourceText
        }
    }
}

open class SMMaxLengthFilter: SMFilterProtocol {
    
    public var maxLengthText: Int
    
    public init(maxLengthText aMaxLengthText: Int) {
        
        maxLengthText = aMaxLengthText
    }
    
    public func filter(_ sourceText: String) -> String {
        
        return String(sourceText.prefix(maxLengthText))
    }
}

open class SMFilterCharacters: SMFilterProtocol {
    
    public var allowedCharacters: String

    public init(allowedCharacters: String) {
        
        self.allowedCharacters = allowedCharacters
    }

    public func filter(_ sourceText: String) -> String {

        return sourceText.filter(allowedCharacters.contains)
    }
}

open class SMFilterDecimal: SMFilterProtocol {
    
    public init() {
    }

    public func filter(_ sourceText: String) -> String {

        return sourceText.filter("0123456789".contains)
    }
}
