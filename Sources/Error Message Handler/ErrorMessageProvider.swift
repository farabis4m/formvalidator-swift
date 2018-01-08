//
//  ErrorMessageProvider.swift
//  FormValidatorSwift iOS
//
//  Created by Fatima Hussain on 12/9/17.
//  Copyright © 2017 ustwo. All rights reserved.
//

import Foundation

public class ErrorMessageProvider {
    
    public static let sharedInstance = ErrorMessageProvider()
    init() {
        // initialization
    }
    
    public func errorWithCode(_ errorCode: String) -> Error? {
        return error(code: errorCode, parameters: nil) ?? NSError(domain:"", code: 0, userInfo:nil)
    }
    
    public func error(code: String, parameters: String?...) -> Error? {
        
        let moduleKeyPath = code[ 0..<2]
        let serviceKeyPath = code[2..<4]
        let errorKeyPath = code[4..<code.count]
        
        guard let module = PlistManager.shared.errors[moduleKeyPath] as? [String : Any],
            let service  = module[serviceKeyPath] as? [String: Any],
            let errorKey = service[errorKeyPath] as? String else { return NSError(domain:"", code: 0, userInfo:[NSLocalizedDescriptionKey:"Key Not found in error plist"]) }
        
        let userInfo: [String : String] = [NSLocalizedDescriptionKey :  &&(errorKey)]
        print(Language.localize(errorKey))
        return NSError(domain:"", code: 0, userInfo: userInfo)
    }
    
}

extension String {
    subscript(_ range: CountableRange<Int>) -> String {
        let idx1 = index(startIndex, offsetBy: range.lowerBound)
        let idx2 = index(startIndex, offsetBy: range.upperBound)
        return String(self[idx1..<idx2])
    }
    var count: Int { return characters.count }
}
