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
        
        self.init()
        let presentCondition = PresentCondition(errorCode: "6000009", error: nil)
        let lengthRangeValidation = LengthRangeCondition(minLength: minLength, maxLength: maxLength, errorCode: "6000012", error: nil)
        let specialCharecterValidation = DCRSpecialCharecterCondition(unAllowedCharacterSet: notAllowedCharacter, errorCode: "6000013", error: nil)
        let numericValidation = DCRNumericCondition(AllowednumberSet: allowedNumbers, errorCode: "6000014", error: nil)
        
        conditions = [presentCondition,lengthRangeValidation,specialCharecterValidation,numericValidation]
    }
    
    public static func checkValue(ioValue: AnyObject?, minLength:Int?, maxLength:Int?, notAllowedCharacter:String?, allowedNumbers:String?, errorCode: inout String) throws -> Bool {
        let validator = DCRPasswordValidator(minLength: minLength, maxLength: maxLength, notAllowedCharacter: notAllowedCharacter, allowedNumbers: allowedNumbers)
        let conditions = validator.checkConditions(ioValue)
        //         validator.errorCode = errorCode
        
        guard conditions == nil else {
            var error: Error?
            if let presentCondition = conditions?.first as? PresentCondition {
                errorCode = presentCondition.errorCode
                if let error =  ErrorMessageProvider.sharedInstance.errorWithCode(errorCode) {
                    throw error
                }
                return false
                
            } else if let lengthRangeCondition = conditions?.first as? LengthRangeCondition {
                errorCode = lengthRangeCondition.errorCode
                if let error = ErrorMessageProvider.sharedInstance.error(code: errorCode, parameters: minLength ?? 0, maxLength ?? 0) {
                    throw error
                }
                return false
            }else if let specialCharecterCondition = conditions?.first as? DCRSpecialCharecterCondition {
                errorCode = specialCharecterCondition.errorCode
                if let error = ErrorMessageProvider.sharedInstance.errorWithCode(errorCode) {
                    throw error
                }
                return false
            }else if let numericCondition = conditions?.first as? DCRNumericCondition {
                errorCode = numericCondition.errorCode
                if let error = ErrorMessageProvider.sharedInstance.errorWithCode(errorCode) {
                    throw error
                }
                return false
            }
            return false
        }
        
        return true
    }
    
    
    
}

