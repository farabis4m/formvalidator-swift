//
//  PinPalindromeCondition.swift
//  FormValidatorSwift iOS
//
//  Created by Muhammed Shibili on 1/10/18.
//  Copyright © 2018 ustwo. All rights reserved.
//

import Foundation

public struct PinPalindromeCondition: Condition {
    
    public var localizedViolationString: String = ""
    
    public var regex: String = ""
    
    public var shouldAllowViolation: Bool = true
    
    public var errorCode: String = ""
    
    public var minimumValue : AnyObject?
    // MARK: - Initializers
    
    public init() { }
    
    init( errorCode: String) {
        self.init()
        self.errorCode = errorCode
    }
    
    public func check(_ value: AnyObject?) -> Bool {
        
        let length: Int = (value?.length) ?? 0
  
        for i in 0..<length / 2 {
            if value?.character(at: i) != value?.character(at: (length - 1 - i)) {
                return true
            }
        }
        
        return false
        
    }
}
