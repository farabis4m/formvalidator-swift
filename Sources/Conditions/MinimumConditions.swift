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

        let inputC = "\(value ?? "")".trimmingCharacters(in: .whitespaces)
        guard inputC.count > 0 else {
            return false
        }
        
        let f = NumberFormatter()
        f.numberStyle = .decimal
        
        let minValue = "\(self.minimumValue ?? "")"

        if let inputN = (f.number(from: inputC)), let minValue = f.number(from: minValue) {
            return inputN.compare(minValue) == .orderedDescending
        }
        return false
    }
}

