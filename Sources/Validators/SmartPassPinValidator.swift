//
//  SmartPassPinValidator.swift
//  FormValidatorSwift iOS
//
//  Created by Muhammed Shibili on 1/10/18.
//  Copyright © 2018 ustwo. All rights reserved.
//

import Foundation

public struct SmartPassPinValidator: Validator {
    
    // MARK: - Properties
    
    public var conditions: [Condition]
    
    
    // MARK: - Initializers
    
    public init() {
        
        conditions = [PinPalindromeCondition(),PinSeriesCondition()]
        
    }
    
    public static func checkValue(ioValue: AnyObject?) throws -> Bool {
        
        let validator = SmartPassPinValidator()
        let conditions = validator.checkConditions(ioValue)
        //        validator.errorCode = errorCode
        
        guard conditions == nil else {
            if let error =  ErrorMessageProvider.sharedInstance.errorWithCode("6000027") {
                throw error
            }
            return false
        }
        return true
    }
    
}
