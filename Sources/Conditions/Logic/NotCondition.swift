//
//  NotCondition.swift
//  FormValidatorSwift
//
//  Created by Aaron McTavish on 13/01/2016.
//  Copyright © 2016 ustwo Fampany Ltd. All rights reserved.
//

import Foundation


/**
 *  A condition that returns the opposite of the original condition.
 */
public struct NotCondition: Condition {
    
    
    // MARK: - Properties
    
    public var localizedViolationString = ""
    
    public let regex = ""
    
    public var shouldAllowViolation = true
    
    public let condition: Condition
    
    public var errorCode: String = ""
    
    // MARK: - Initializers
    
    public init() {
        self.init(condition: AlphanumericCondition())
    }
    
    public init(condition: Condition) {
        self.condition = condition
    }
    
    
    // MARK: - Check
    
    public func check(_ value: Any?) -> Bool {
        return !condition.check(value)
    }
    
}
