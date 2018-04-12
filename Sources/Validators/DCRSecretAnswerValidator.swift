//
//  DCRSecretAnswerValidator.swift
//  FormValidatorSwift iOS
//
//  Created by Fatima on 4/12/18.
//  Copyright © 2018 ustwo. All rights reserved.
//

import Foundation
import Foundation

public struct DCRSecretAnswerValidator: Validator {

    // MARK: - Properties
    public var conditions: [Condition]
    
    public init() {
        conditions = [DCRSecretAnswerCondition()]
    }
    
    public init(minLength: Int?,maxLength: Int?, notAllowedCharacter: String?, allowedNumbers: String?) {
        
        self.init()
        let presentCondition = PresentCondition(errorCode: "6000030", error: nil)
        let lengthRangeValidation = LengthRangeCondition(minLength: minLength, maxLength: maxLength, errorCode: "6000012", error: nil)
        let specialCharecterValidation = DCRSpecialCharecterCondition(unAllowedCharacterSet: notAllowedCharacter, errorCode: "6000033", error: nil)

        conditions = [presentCondition,lengthRangeValidation,specialCharecterValidation]
    }
    
    public static func checkValue(ioValue: AnyObject?, minLength:Int?, maxLength:Int?, notAllowedCharacter:String?, allowedNumbers:String?, errorCode: inout String) throws -> Bool {
        let validator = DCRSecretAnswerValidator(minLength: minLength, maxLength: maxLength, notAllowedCharacter: notAllowedCharacter, allowedNumbers: allowedNumbers)
        let conditions = validator.checkConditions(ioValue)
        //         validator.errorCode = errorCode
        
        guard conditions == nil else {
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
                var param = notAllowedCharacter ?? ""
                if let error = ErrorMessageProvider.sharedInstance.error(code: errorCode, parameters: param ) {
                    throw error
                }
                return false
            }else if let numericCondition = conditions?.first as? DCRNumericCondition {
                let errorCode = numericCondition.errorCode
                if let error = ErrorMessageProvider.sharedInstance.error(code: errorCode, parameters: allowedNumbers ?? "") {
                    throw error
                }
                return false
            }
            return false
        }
        
        return true
    }
    
    
}
