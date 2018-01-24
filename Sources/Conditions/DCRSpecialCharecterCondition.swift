//
//  DCRSpecialCharecterCondition.swift
//  FormValidatorSwift iOS
//
//  Created by Muhammed Shibili on 1/24/18.
//  Copyright © 2018 ustwo. All rights reserved.
//

import Foundation

public struct DCRSpecialCharecterCondition: Condition {
    
    public var localizedViolationString: String = ""
    
    public var regex: String = ""
    
    public var shouldAllowViolation: Bool = true
    
    public var errorCode: String = ""
    
    public var error: Error?
    
    public var unAllowedCharacterSet : String?
    // MARK: - Initializers
    
    public init() { }
    
    init(unAllowedCharacterSet: String?, errorCode: String, error: Error?) {
        self.init()
        self.errorCode = errorCode
        self.unAllowedCharacterSet = unAllowedCharacterSet
        self.error = error
    }
    
    public func check(_ value: AnyObject?) -> Bool {
        if let isString = value as? String {
            let valueString = isString.components(separatedBy: CharacterSet(charactersIn: unAllowedCharacterSet ?? ""))
            if valueString.count > 1{
                return false
            }
        }
        return true
    }
    
}
