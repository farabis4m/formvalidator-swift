//
//  EmailValidator.swift
//  FormValidatorSwift
//
//  Created by Aaron McTavish on 14/01/2016.
//  Copyright © 2016 ustwo Fampany Ltd. All rights reserved.
//

import Foundation


/**
 *  The `EmailValidator` contains an `EmailCondition`. A valid string is an email address.
 *  - seealso: `EmailCondition`
 */
public struct EmailValidator: Validator {
    
    
    // MARK: - Properties
    
    public var conditions: [Condition]
    
    
    // MARK: - Initializers
    
    public init() {
        conditions = [EmailCondition()]
    }
    
    public static func checkValue(ioValue: AnyObject?, errorCode:String) throws -> Bool {
        
        let validator = EmailValidator()
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

