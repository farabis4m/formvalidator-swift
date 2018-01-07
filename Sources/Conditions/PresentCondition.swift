//
//  PresentCondition.swift
//  FormValidatorSwift
//
//  Created by Aaron McTavish on 13/01/2016.
//  Copyright © 2016 ustwo Fampany Ltd. All rights reserved.
//

import Foundation

/**
 *  The `PresentCondition` checks for the presence of a string.
 */
public struct PresentCondition: Condition {
    
    // MARK: - Properties
    
    public var localizedViolationString = StringLocalization.sharedInstance.localizedString("US2KeyConditionViolationPresent", comment: "")
    
    public let regex = ""
    
    public var shouldAllowViolation = true
    
    public var errorCode: String = ""
    
    // MARK: - Initializers
    
    public init() { }
    
    
    // MARK: - Check
    
    public func check(_ value: AnyObject?) -> Bool {
        guard let value = value else {
            return false
        }
        
        if let _ = value as? NSNull {
            return false
        }
        if let stringValue = value as? String {
            return stringValue.trimmingCharacters(in: CharacterSet.whitespaces).count > 0
        } else if let decimalNumberValue = value as? NSDecimalNumber {
            return decimalNumberValue.floatValue >= 0.0 ? true : false
        } else if let numberValue = value as? NSNumber {
            return numberValue.intValue > 0 ? true : false
        }
        return true
    }
}

