//
//  Language.swift
//  ENBDFitness
//
//  Created by Thahir Maheen on 8-10-17.
//  Copyright © 2017 Solutions 4 Mobility. All rights reserved.
//

import Foundation

/// operator to localize a string
prefix operator &&

prefix func && (string: String?) -> String {
    guard let string = string else { return "" }
    return Language.localize(string)
}

enum Language: String {
    case english = "en"
    case arabic = "ar"
    
    var locale: String {
        return rawValue
    }
}

extension Language {
    fileprivate struct Keys {
        static let preferred = "UserPreferedAppLanguage"
        static let device = "AppleLanguages"
    }
}

extension Language {

    /// current language if user has preferred one or the device language
    static var current: Language {
        get {
            guard let preferred = UserDefaults.standard.string(forKey: Keys.preferred) else {
                
                // save device language as preferred
                Language.current = Language.device
                
                return Language.device
            }
            
            return Language(rawValue: preferred) ?? .english
        }
        set {
            UserDefaults.standard.set(newValue.locale, forKey: Keys.preferred)
            UserDefaults.standard.synchronize()
        }
    }
    
    
    /// returns the device language. returns arabic if device language is arabic, else returns english
    static var device: Language {
        guard let deviceLanguages = UserDefaults.standard.object(forKey: Keys.device) as? [String],
            let deviceLanguage = deviceLanguages.first,
            let _ = deviceLanguage.range(of: "ar") else { return .english }
        
        return .arabic
    }
}

extension Language {
    /// localize
    static func localize(_ string: String) -> String {
        guard let all = PlistManager.shared.localizations[string] as? [String: String], let localizedString = all[Language.current.locale] else { return string }
        return localizedString
    }
}
