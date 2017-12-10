//
//  MinimumValueValidator.swift
//  FormValidatorSwift iOS
//
//  Created by Fatima Hussain on 12/10/17.
//  Copyright © 2017 ustwo. All rights reserved.
//

import Foundation

/**
 *  The `MinimumValueValidator` contains an `PresentCondition`. A valid string is a non-empty string and also have some minimum value
 *
 */
public struct MinimumValueValidator: Validator {

    // MARK: - Properties
    
    public var conditions: [Condition]
    
    
    // MARK: - Initializers
    
    public init() {
        conditions = [PresentCondition()]
    }
    
    public init(minimumValue: AnyObject?, errorCode: String) {
        let presentCondition = PresentCondition()
        let minimumValueCondition = MinimumConditions(minimumValue: minimumValue, errorCode: errorCode)
        conditions = [presentCondition,minimumValueCondition]
    }
    
    public static func checkValue(ioValue: AnyObject?, minValue:AnyObject?, errorCode:String) throws -> Bool {
        
        let validator = MinimumValueValidator(minimumValue: minValue, errorCode: errorCode)
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

