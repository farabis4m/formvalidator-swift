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
    
    // MARK: - Initializers
    
    public init() { }
    
    init( errorCode: String) {
        self.init()
        self.errorCode = errorCode
    }
    
    public func check(_ value: AnyObject?) -> Bool {
        return self.validateRepeatation(value: value) && self.sequenceValidate(value: value)
    }
    
    
    func sequenceValidate(value: AnyObject?) -> Bool {
        
        if let values = value {
            let valuelist = String(describing: values).flatMap{Int(String($0))}
            let consecutives = valuelist.map { $0 - 1 }.dropFirst() == valuelist.dropLast()
            return !consecutives
        }
        return true
        
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




