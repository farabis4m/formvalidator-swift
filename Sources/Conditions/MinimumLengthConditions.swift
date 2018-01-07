//
//  MinimumLengthConditions.swift
//  FormValidatorSwift iOS
//
//  Created by Muhammed Shibili on 1/7/18.
//  Copyright © 2018 ustwo. All rights reserved.
//

import Foundation

public struct MinimumLengthConditions: Condition {
    
    public var localizedViolationString: String = ""
    
    public var regex: String = ""
    
    public var shouldAllowViolation: Bool = true
    
    public var errorCode: String = ""
    
    public var minimumLength : Int?
    // MARK: - Initializers
    
    public init() { }
    
    init(minimumLength: Int?, errorCode: String) {
        self.init()
        self.errorCode = errorCode
        self.minimumLength = minimumLength
    }
    
    public func check(_ value: AnyObject?) -> Bool {
        let minValue = value
        
        if let minValue1 = minValue as? String {
            return (minValue1.trimmingCharacters(in: CharacterSet.whitespaces).count) >= minimumLength ?? 0
        }
        
        return true
    }
    
}
