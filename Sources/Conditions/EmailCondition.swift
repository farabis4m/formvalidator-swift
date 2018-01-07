//
//  EmailCondition.swift
//  FormValidatorSwift
//
//  Created by Aaron McTavish on 13/01/2016.
//  Copyright © 2016 ustwo Fampany Ltd. All rights reserved.
//

import Foundation


/**
 *  The `EmailCondition` checks a string for an email.
 */
public struct EmailCondition: Condition {
    
    
    // MARK: - Properties
    
    public var localizedViolationString = StringLocalization.sharedInstance.localizedString("US2KeyConditionViolationEmail", comment: "")
    
    public let regex = "^[+\\w\\.\\-']+@[a-zA-Z0-9-]+(\\.[a-zA-Z0-9-]+)*(\\.[a-zA-Z]{2,})+$"
    
    public var shouldAllowViolation = true
    
    public var errorCode: String = ""
    
    // MARK: - Initializers
    
    public init() { }
    
    public func check(_ value: AnyObject?) -> Bool {
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", regex)
        return emailTest.evaluate(with: value)
        
    }
}
