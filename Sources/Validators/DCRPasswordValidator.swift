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
    
    public init(minLength: Int?,maxLength: Int?, notAllowedCharacter: String?, allowedNumbers: String?, error: Error?) {
        let presentCondition = PresentCondition(errorCode: "6000009", error: error)
        let lengthRangeValidation = LengthRangeCondition(minLength: minLength, maxLength: maxLength, errorCode: "6000012", error: error)
        conditions = [presentCondition,lengthRangeValidation]
    }
    
    public static func checkValue(ioValue: AnyObject?, minLength:Int?, maxLength:Int?, notAllowedCharacter:String?, allowedNumbers:String?, error: inout Error?) throws -> Bool {
        
        let validator = DCRPasswordValidator(minLength: minLength, maxLength: maxLength, notAllowedCharacter: notAllowedCharacter, allowedNumbers: allowedNumbers,error: error)
        let conditions = validator.checkConditions(ioValue)
        //         validator.errorCode = errorCode
        
        guard conditions == nil else {
            if error == nil {
                error = ErrorMessageProvider.sharedInstance.errorWithCode("")
            }
            
            if let error = error {
                throw error
            }
            return false
        }
        
        return true
    }
    
}
