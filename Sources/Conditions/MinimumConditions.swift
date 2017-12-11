//
//  MinimumConditions.swift
//  FormValidatorSwift iOS
//
//  Created by Fatima Hussain on 12/10/17.
//  Copyright © 2017 ustwo. All rights reserved.
//

import Foundation

public struct MinimumConditions: Condition {

    public var localizedViolationString: String = ""
    
    public var regex: String = ""
    
    public var shouldAllowViolation: Bool = true
    
    public var errorCode: String = ""
    
    public var minimumValue : Any?
    // MARK: - Initializers
    
    public init() { }
    
    init(minimumValue: Any?, errorCode: String) {
        self.init()
        self.errorCode = errorCode
        self.minimumValue = minimumValue
    }
    
    public func check(_ value: Any?) -> Bool {
        
        var minValue = value
        if (minValue is String) {
            let f = NumberFormatter()
            f.numberStyle = .decimal
            minValue = (f.number(from: minValue as? String ?? "")) ?? 0
        }
        
        if let minValue1 = minValue as? NSDecimalNumber, let minValue2 = self.minimumValue as? NSDecimalNumber, minValue1.compare(minValue2) == .orderedAscending {
            return false
        }
        
        return true
    }
}

