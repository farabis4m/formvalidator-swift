//
//  DCRPasswordValidator.swift
//  FormValidatorSwift iOS
//
//  Created by Muhammed Shibili on 1/23/18.
//  Copyright © 2018 ustwo. All rights reserved.
//

import Foundation

public struct DCRPasswordValidator: Validator {
    
    // MARK: - Properties
    
    public var conditions: [Condition]
    
    
    // MARK: - Initializers
    
    public init() {
        conditions = [DCRPasswordCondition()]
    }
    
    public init(minLength: Int?,maxLength: Int?, notAllowedCharacter: String?, allowedNumbers: String?) {
        let presentCondition = PresentCondition(errorCode: "6000009", error: nil)
        let lengthRangeValidation = LengthRangeCondition(minLength: minLength, maxLength: maxLength, errorCode: "6000012", error: nil)
        conditions = [presentCondition,lengthRangeValidation]
    }
    
    public static func checkValue(ioValue: AnyObject?, minLength:Int?, maxLength:Int?, notAllowedCharacter:String?, allowedNumbers:String?) throws -> Bool {
        
        let validator = DCRPasswordValidator(minLength: minLength, maxLength: maxLength, notAllowedCharacter: notAllowedCharacter, allowedNumbers: allowedNumbers)
        let conditions = validator.checkConditions(ioValue)
        //         validator.errorCode = errorCode
        
        guard conditions == nil else {
            if let error =  ErrorMessageProvider.sharedInstance.errorWithCode("") {
                throw error
            }
            return false
        }
        
        return true
    }
    
}

