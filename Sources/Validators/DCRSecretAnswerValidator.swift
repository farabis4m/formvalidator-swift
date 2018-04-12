//
//  DCRSecretAnswerValidator.swift
//  FormValidatorSwift iOS
//
//  Created by Fatima on 4/12/18.
//  Copyright © 2018 ustwo. All rights reserved.
//

import Foundation
import Foundation

public struct DCRSecretAnswerValidator: DCRPasswordValidator {

    public init() {
        conditions = [DCRPasswordCondition()]
    }
    
    public init(minLength: Int?,maxLength: Int?, notAllowedCharacter: String?, allowedNumbers: String?) {
        
        self.init()
        let presentCondition = PresentCondition(errorCode: "6000030", error: nil)
        let lengthRangeValidation = LengthRangeCondition(minLength: minLength, maxLength: maxLength, errorCode: "6000012", error: nil)
        let specialCharecterValidation = DCRSpecialCharecterCondition(unAllowedCharacterSet: notAllowedCharacter, errorCode: "6000033", error: nil)
        let numericValidation = DCRNumericCondition(AllowednumberSet: allowedNumbers, errorCode: "6000034", error: nil)
        
        conditions = [presentCondition,lengthRangeValidation,specialCharecterValidation,numericValidation]
    }
}
