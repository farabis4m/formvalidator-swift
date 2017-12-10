//
//  PlistManager.swift
//  ENBDFitness
//
//  Created by Thahir Maheen on 8-10-17.
//  Copyright © 2017 Solutions 4 Mobility. All rights reserved.
//

import Foundation

class PlistManager {
    
    // singleton
    static let shared = PlistManager()
    private init() {
        //Intialization
    }
    
    // localizations
    lazy var localizations: [String: Any] = {
        return PlistManager.shared.loadDictionary(for: Paths.strings)
    }()
    
    // localizations
    lazy var errors: [String: Any] = {
        return PlistManager.shared.loadDictionary(for: Paths.errors)
    }()
    
    // loads dictionary from plist file
    private func loadDictionary(for path: String?) -> [String: Any] {
        guard let path = path, let dictionary = NSDictionary(contentsOfFile: path) as? [String: Any] else { return [:] }
        return dictionary
    }
}

extension PlistManager {
    struct Paths {
        static let strings = Bundle.main.path(forResource: "Strings", ofType: "plist")
        static let errors = Bundle.main.path(forResource: "Error", ofType: "plist")
    }
    
}

