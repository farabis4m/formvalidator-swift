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
    
    public func check(_ value: Any?) -> Bool {
        
        let inputC = "\(value ?? "")".trimmingCharacters(in: .whitespaces)
        guard inputC.count > 0 else {
            return false
        }
        
        let f = NumberFormatter()
        f.numberStyle = .decimal

        if let inputN = f.number(from: inputC) {
            return inputN.intValue > 0
        }
        return false
    }
}

