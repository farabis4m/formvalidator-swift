//
//  DCRSecretAnswerCondition.swift
//  FormValidatorSwift iOS
//
//  Created by Fatima on 4/12/18.
//  Copyright © 2018 ustwo. All rights reserved.
//

import Foundation

public struct DCRSecretAnswerCondition: Condition {
    public var localizedViolationString: String = ""
    
    public var regex: String = ""
    
    public var shouldAllowViolation: Bool = true
    
    public var errorCode: String = ""
    
    public var error: Error?
    
    public var minLength : Int?
    
    public var maxLength : Int?
    
    public var notAllowedCharacter : String?
    
    public var allowedNumbers : String?
    
    // MARK: - Initializers
    
    public init() { }
    
    init(minLength: Int?,maxLength: Int?, notAllowedCharacter: String?, allowedNumbers: String?) {
        self.init()
        self.maxLength = maxLength
        self.minLength = minLength
        self.allowedNumbers = allowedNumbers
        self.notAllowedCharacter = notAllowedCharacter
    }
    
}
