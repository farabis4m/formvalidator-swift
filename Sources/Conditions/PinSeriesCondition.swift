//
//  PinSeriesCondition.swift
//  FormValidatorSwift iOS
//
//  Created by Muhammed Shibili on 1/10/18.
//  Copyright © 2018 ustwo. All rights reserved.
//

import Foundation

public struct PinSeriesCondition: Condition {
    
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
        return self.sequenceValidate(value: value) && self.validateRepeatation(value: value)
    }
    
    
    func sequenceValidate(value: AnyObject?) -> Bool {
        
        let length: Int = (value?.length) ?? 0
        let firstValue = value?.character(at: 0)
        
        if let firstValue = firstValue, let valueAtIndex1 = (value?.character(at: 1))  {
            for i in 0..<length {
                if (valueAtIndex1 - firstValue != i) {
                    return true
                }
            }
        }
        
        return false
    }
    
    func validateRepeatation(value: AnyObject?) -> Bool {
       
        let length: Int = (value?.length) ?? 0
        for i in 0..<length {
            var count: Int = 0
            for j in 0..<length {
                if value?.character(at: i) == value?.character(at: j) {
                    count += 1
                    if count == 3 {
                        return false
                        //Invalid
                    }
                }
            }
        }
        return true
    }

}



