//
//  ExactLengthCondition.swift
//  FormValidatorSwift iOS
//
//  Created by Muhammed Shibili on 1/7/18.
//  Copyright © 2018 ustwo. All rights reserved.
//

import Foundation

public struct ExactLengthCondition: Condition {
    
    public var localizedViolationString: String = ""
    
    public var regex: String = ""
    
    public var shouldAllowViolation: Bool = true
    
    public var errorCode: String = ""
    
    public var exactLength : Int?
    // MARK: - Initializers
    
    public init() { }
    
    init(exactLength: Int?, errorCode: String) {
        self.init()
        self.errorCode = errorCode
        self.exactLength = exactLength
    }
    
    public func check(_ value: AnyObject?) -> Bool {
        let valueLength = value
        
        if valueLength?.count == exactLength {
            return true
        }
        
        return false
    }
    
}
