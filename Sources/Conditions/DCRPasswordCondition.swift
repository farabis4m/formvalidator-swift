//
//  DCRPasswordCondition.swift
//  FormValidatorSwift iOS
//
//  Created by Muhammed Shibili on 1/23/18.
//  Copyright © 2018 ustwo. All rights reserved.
//

import Foundation

public struct DCRPasswordCondition: Condition {
    
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
    
    init(minLength: Int?,maxLength: Int?, notAllowedCharacter: String?, allowedNumbers: String?, error: Error?) {
        self.init()
        self.maxLength = maxLength
        self.minLength = minLength
        self.allowedNumbers = allowedNumbers
        self.notAllowedCharacter = notAllowedCharacter
        self.error = error
    }
    
    public func check(_ value: AnyObject?) -> Bool {
//        if let isString = value as? String, isString.count == exactLength {
//            return true
//        } else if let length = value as? Int {
//            return length == exactLength
//        }
        
        return false
    }
    
}
