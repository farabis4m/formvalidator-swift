//
//  LengthRangeValidator.swift
//  FormValidatorSwift iOS
//
//  Created by Muhammed Shibili on 1/16/18.
//  Copyright © 2018 ustwo. All rights reserved.
//

import Foundation

public struct LengthRangeValidator: Validator {
    
    // MARK: - Properties
    
    public var conditions: [Condition]

    // MARK: - Initializers
    
    public init() {
        conditions = [LengthRangeCondition()]
    }
    
    public init(minLength: Int?, maxLength: Int?, errorCode: String, error: Error?) {
        let presentCondition = PresentCondition()
        let exactLengthCondition = LengthRangeCondition(minLength: minLength, maxLength: maxLength, errorCode: errorCode, error: error)
        conditions = [presentCondition,exactLengthCondition]
    }
    
    public static func checkValue(ioValue: AnyObject?, minLength:Int?, maxLength:Int?, errorCode:String?, error: inout Error?) throws -> Bool {
        
        let validator = LengthRangeValidator(minLength: minLength, maxLength: maxLength, errorCode: errorCode ?? "", error: error)
        let conditions = validator.checkConditions(ioValue)
        //         validator.errorCode = errorCode
        
        guard conditions == nil else {
            if error == nil {
                error = ErrorMessageProvider.sharedInstance.errorWithCode(errorCode ?? "")
                
            }
            
            if let error = error {
                throw error
            }
            return false
        }
        
        return true
    }
    
}
