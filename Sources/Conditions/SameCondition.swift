//
//
//  FormValidatorSwift iOS
//
//  Created by Muhammed Shibili on 1/10/18.
//  Copyright © 2018 ustwo. All rights reserved.
//

import Foundation

public struct SameCondition: Condition {
    
    public var localizedViolationString: String = ""
    
    public var regex: String = ""
    
    public var shouldAllowViolation: Bool = true
    
    public var errorCode: String = ""
    
    public var comparisonString: String?
    // MARK: - Initializers
    
    public init() { }
    
    init(comparisonString: String?, errorCode: String) {
        self.init()
        self.errorCode = errorCode
        self.comparisonString = comparisonString
    }
    
    public func check(_ value: AnyObject?) -> Bool {
        
        if let value = value as? String, value == comparisonString {
            return true
        }
        return false

    }
}

