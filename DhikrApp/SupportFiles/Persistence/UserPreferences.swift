//
//  UserPreferences.swift
//  DhikrApp
//
//  Created by Abdulla Civuli on 9.12.24.
//

import Foundation

class UserPreferences {
    static let uds = UserDefaults.standard
    
    enum Constants {
        static let arabicFontSizeKey = "arabicFontSizeKey"
        static let transliterationFontSizeKey = "transliterationFontSizeKey"
        static let translatedFontSizeKey = "translatedFontSizeKey"
        static let selectedAppearanceKey = "selectedAppearanceKey"
    }
    
    class func setArabicFontSize(_ size: Float) {
        uds.set(size, forKey: Constants.arabicFontSizeKey)
    }
    
    class func setTransliterationFontSize(_ size: Float) {
        uds.set(size, forKey: Constants.transliterationFontSizeKey)
    }
    
    class func setTranslationFontSize(_ size: Float) {
        uds.set(size, forKey: Constants.translatedFontSizeKey)
    }
    
    class func getArabicFontSize() -> Float? {
        uds.value(forKey: Constants.arabicFontSizeKey) as? Float
    }
    
    class func getTransliterationFontSize() -> Float? {
        uds.value(forKey: Constants.transliterationFontSizeKey) as? Float
    }
    
    class func getTranslationFontSize() -> Float? {
        uds.value(forKey: Constants.translatedFontSizeKey) as? Float
    }
    
    class func setAppearanceSelectionIndex(selectedAppearanceIndex: Int) {
        uds.set(selectedAppearanceIndex, forKey: Constants.selectedAppearanceKey)
    }
    
    class func getApperanceSelectionIndex() -> Int? {
        uds.value(forKey: Constants.selectedAppearanceKey) as? Int
    }
}
