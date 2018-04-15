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
        let minimumLengthCondition = MinimumLengthConditions(minimumLength: minLength, errorCode: "6000015")
        let specialCharecterCondition = DCRSpecialCharecterCondition(unAllowedCharacterSet: notAllowedCharacter, errorCode: "6000035", error: nil)

        conditions = [presentCondition,minimumLengthCondition,specialCharecterCondition]
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
                
            } else if let minimumLengthCondition = conditions?.first as? MinimumLengthConditions {
                errorCode = minimumLengthCondition.errorCode
                if let error = ErrorMessageProvider.sharedInstance.errorWithCode(errorCode) {
                    throw error
                }
                return false
            }else if let specialCharecterCondition = conditions?.first as? DCRSpecialCharecterCondition {
                errorCode = specialCharecterCondition.errorCode
                let param = notAllowedCharacter ?? ""
                if let error = ErrorMessageProvider.sharedInstance.error(code: errorCode, parameters: param ) {
                    throw error
                }
                return false
            }
            return false
        }
        
        return true
    }
    
    
}
