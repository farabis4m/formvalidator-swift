//
//  DCRNumericCondition.swift
//  FormValidatorSwift iOS
//
//  Created by Muhammed Shibili on 1/24/18.
//  Copyright © 2018 ustwo. All rights reserved.
//

import Foundation

public struct DCRNumericCondition: Condition {

    public var localizedViolationString: String = ""

    public var regex: String = ""

    public var shouldAllowViolation: Bool = true

    public var errorCode: String = ""

    public var error: Error?

    public var AllowednumberSet : String?
    // MARK: - Initializers

    public init() { }

    init(AllowednumberSet: String?, errorCode: String, error: Error?) {
        self.init()
        self.errorCode = errorCode
        self.AllowednumberSet = AllowednumberSet
        self.error = error
    }

    public func check(_ value: AnyObject?) -> Bool {
        if let isString = value as? String {
            
            let capitalLetterRegEx  = ".*[a-zA-Z]+.*"
            let texttest = NSPredicate(format:"SELF MATCHES %@", capitalLetterRegEx)
            guard texttest.evaluate(with: isString) else { return false }
            
            let numberRegEx  = ".*[0-9]+.*"
            let texttest1 = NSPredicate(format:"SELF MATCHES %@", numberRegEx)
            guard texttest1.evaluate(with: isString) else { return false }
            
        }
        return true
    }

}

