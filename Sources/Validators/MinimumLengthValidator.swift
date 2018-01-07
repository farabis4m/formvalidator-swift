//
//  MinimumLengthValidator.swift
//  FormValidatorSwift iOS
//
//  Created by Muhammed Shibili on 1/7/18.
//  Copyright © 2018 ustwo. All rights reserved.
//

import Foundation

public struct MinimumLengthValidator: Validator {
    
    // MARK: - Properties
    
    public var conditions: [Condition]
    
    
    // MARK: - Initializers
    
    public init() {
        conditions = [MinimumLengthConditions()]
    }
    
    public init(minimumLength: Int?, errorCode: String) {
        let presentCondition = PresentCondition()
        let minimumLengthCondition = MinimumLengthConditions(minimumLength: minimumLength, errorCode: errorCode)
        conditions = [presentCondition,minimumLengthCondition]
    }
    
    public static func checkValue(ioValue: AnyObject?, minLength:Int?, errorCode:String) throws -> Bool {
        
        let validator = MinimumLengthValidator(minimumLength: minLength, errorCode: errorCode)
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
