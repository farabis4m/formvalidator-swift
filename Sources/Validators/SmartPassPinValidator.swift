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
        
        conditions = [MinimumLengthConditions(),PinPalindromeCondition(errorCode: "6000027"),PinSeriesCondition(errorCode: "6000027")]
        
    }

    public static func checkValue(ioValue: AnyObject?, errorCode:String) throws -> Bool {
        
        let validator = SmartPassPinValidator()
        let conditions = validator.checkConditions(ioValue)
        //         validator.errorCode = errorCode
        
        guard conditions == nil else {
            if let error =  ErrorMessageProvider.sharedInstance.errorWithCode(errorCode) {
                throw error
            }
            return false
        }
        
        return true
    }
    
}
