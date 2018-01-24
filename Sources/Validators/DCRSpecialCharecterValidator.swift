//
//  DCRSpecialCharecterValidator.swift
//  FormValidatorSwift iOS
//
//  Created by Muhammed Shibili on 1/24/18.
//  Copyright © 2018 ustwo. All rights reserved.
//

import Foundation

public struct DCRSpecialCharecterValidator: Validator {
    
    // MARK: - Properties
    
    public var conditions: [Condition]
    
    
    // MARK: - Initializers
    
    public init() {
        conditions = [DCRSpecialCharecterCondition()]
    }
    
    public init(unAllowedCharacterSet: String?, errorCode: String, error: Error?) {
        
        let specialCharecterCondition = DCRSpecialCharecterCondition(unAllowedCharacterSet: unAllowedCharacterSet, errorCode: errorCode, error: error)
        
        conditions = [specialCharecterCondition]
    }
    
    public static func checkValue(ioValue: AnyObject?, unAllowedCharacterSet: String?, errorCode:String?, error: inout Error?) throws -> Bool {
        
        let validator = DCRSpecialCharecterValidator(unAllowedCharacterSet: unAllowedCharacterSet,errorCode: errorCode ?? "", error: error)
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

