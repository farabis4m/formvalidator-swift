//
//  PresentValidator.swift
//  FormValidatorSwift
//
//  Created by Aaron McTavish on 14/01/2016.
//  Copyright © 2016 ustwo Fampany Ltd. All rights reserved.
//

import Foundation


/**
 *  The `PresentValidator` contains an `PresentCondition`. A valid string is a non-empty string.
 *  - seealso: `PresentCondition`
 */
public struct PresentValidator: Validator {
    
    
    // MARK: - Properties
    
    public var conditions: [Condition]
    
    
    // MARK: - Initializers
    
    public init() {
        conditions = [PresentCondition()]
    }
    
    public init(errorCode: String, error: Error?) {
        conditions = [PresentCondition(errorCode: errorCode, error: error)]
    }
    
    public static func checkValue(ioValue: AnyObject?, errorCode: String) throws -> Bool {
        
        let validator = PresentValidator()
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
    
    public static func checkValue(ioValue: AnyObject?, errorCode: String?, error: Error?) throws -> Bool {
        
        let validator = PresentValidator(errorCode: errorCode ?? "", error: error)
        let conditions = validator.checkConditions(ioValue)
        //         validator.errorCode = errorCode
        
        guard conditions == nil else {
            if let error =  ErrorMessageProvider.sharedInstance.errorWithCode(errorCode ?? "") {
                throw error
            }
            return false
        }
        
        return true
    }

}

