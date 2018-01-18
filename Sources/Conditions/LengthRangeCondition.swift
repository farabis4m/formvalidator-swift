//
//  LengthRangeCondition.swift
//  FormValidatorSwift iOS
//
//  Created by Muhammed Shibili on 1/16/18.
//  Copyright © 2018 ustwo. All rights reserved.
//

import Foundation

public struct LengthRangeCondition: Condition {
    
    public var localizedViolationString: String = ""
    
    public var regex: String = ""
    
    public var shouldAllowViolation: Bool = true
    
    public var errorCode: String = ""
    
    public var error: Error?
    
    public var minLength : Int?
    
    public var maxLength : Int?
    // MARK: - Initializers
    
    public init() { }
    
    init(minLength: Int?, maxLength: Int?, errorCode: String, error: Error?) {
        self.init()
        self.errorCode = errorCode
        self.minLength = minLength
        self.maxLength = maxLength
    }
    
    public func check(_ value: AnyObject?) -> Bool {
        if let stringValue = value as? String {
            let valuesCount = stringValue.trimmingCharacters(in: CharacterSet.whitespaces).count
            return valuesCount >= minLength ?? 0 && valuesCount <= maxLength ?? 0
        }
        
        return false
    }
}

