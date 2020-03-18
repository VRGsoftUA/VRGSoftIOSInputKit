//
//  SMFormatter.swift
//  SwiftKit
//
//  Created by OLEKSANDR SEMENIUK on 1/19/17.
//  Copyright © 2017 VRG Soft. All rights reserved.
//

import Foundation

public protocol SMFormatterProtocol: Any {
    
    var mask: String { get set }
    func formatter(originalString aOriginalString: String?) -> String?
    func formatter(forText aText: String,
                   shouldChangeCharactersInRange aRange: NSRange,
                   replacementString aString: String) -> String
}

extension SMFormatterProtocol {
    
    public func formatter(originalString aOriginalString: String?) -> String? {
        
        guard let originalString: String = aOriginalString else {
            return nil
        }
        
        return SMFormatter.addFormatter(text: originalString, mask: mask)
    }
    
    public func formatter(forText aText: String,
                          shouldChangeCharactersInRange aRange: NSRange,
                          replacementString aString: String) -> String {
        
        let newText: String = (aText as NSString).replacingCharacters(in: aRange, with: aString)
        let text: String = SMFormatter.removeFormatter(formattedText: newText, withMask: mask)
        
        return SMFormatter.addFormatter(text: text, mask: mask)
    }
}

open class SMFormatter: SMFormatterProtocol {
    
    public var mask: String
    
    public init(with mask: String) {

        self.mask = mask
    }
    
    static public func addFormatter(text aText: String,
                                    mask aMask: String) -> String {
        
        var result: String = ""
        var currentIndex = aText.startIndex

        for ch: Character in aMask where currentIndex < aText.endIndex {

            if ch == "X" {

                result.append(aText[currentIndex])
                currentIndex = aText.index(after: currentIndex)
            } else {

                result.append(ch)
            }
        }

        return result
    }
    
    static public func removeFormatter(formattedText aText: String,
                                       withMask aMask: String) -> String {
        
        var inputString: String = ""
        
        var currentIndex: String.Index = aText.startIndex
        for ch: Character in aMask where currentIndex < aText.endIndex {

            if ch == "X" {

                inputString.append(aText[currentIndex])
            }

            currentIndex = aText.index(after: currentIndex)
        }
        
        return inputString
    }
}
