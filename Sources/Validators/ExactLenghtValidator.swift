//
//  ExactLenghtValidator.swift
//  FormValidatorSwift iOS
//
//  Created by Muhammed Shibili on 1/7/18.
//  Copyright © 2018 ustwo. All rights reserved.
//

import Foundation

public struct ExactLenghtValidator: Validator {
    
    // MARK: - Properties
    
    public var conditions: [Condition]
    
    
    // MARK: - Initializers
    
    public init() {
        conditions = [ExactLengthCondition()]
    }
    
    public init(exactLength: Int?, errorCode: String) {
        let presentCondition = PresentCondition()
        let exactLengthCondition = ExactLengthCondition(exactLength: exactLength, errorCode: errorCode)
        conditions = [presentCondition,exactLengthCondition]
    }
    
    public static func checkValue(ioValue: AnyObject?, exactLength:Int?, errorCode:String) throws -> Bool {
        
        let validator = ExactLenghtValidator(exactLength: exactLength, errorCode: errorCode)
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

