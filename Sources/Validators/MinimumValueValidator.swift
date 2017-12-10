//
//  MinimumValueValidator.swift
//  FormValidatorSwift iOS
//
//  Created by Fatima Hussain on 12/10/17.
//  Copyright © 2017 ustwo. All rights reserved.
//

import Foundation

/**
 *  The `MinimumValueValidator` contains an `PresentCondition`. A valid string is a non-empty string and also have some minimum value
 *
 */
public struct MinimumValueValidator: Validator {

    // MARK: - Properties
    
    public var conditions: [Condition]
    
    
    // MARK: - Initializers
    
    public init() {
        conditions = [PresentCondition()]
    }
    
    
}
