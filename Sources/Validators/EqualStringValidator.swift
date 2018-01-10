//
//  EqualStringValidator.swift
//  FormValidatorSwift iOS
//
//  Created by Muhammed Shibili on 1/10/18.
//  Copyright © 2018 ustwo. All rights reserved.
//

import Foundation

public struct EqualStringValidator: Validator {
    
    // MARK: - Properties
    
    public var conditions: [Condition]

    // MARK: - Initializers
    
    public init() {
        conditions = [SameCondition()]
    }
    
    public init(comparisonString: String?, errorCode: String) {
        conditions = [SameCondition(comparisonString: comparisonString, errorCode: errorCode)]
    }
    
    public static func checkValue(ioValue: AnyObject?, comparisonString:String?, errorCode:String) throws -> Bool {
        
        let validator = EqualStringValidator(comparisonString: comparisonString, errorCode: errorCode)
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
