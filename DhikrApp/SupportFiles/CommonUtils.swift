//
//  CommonUtils.swift
//  DhikrApp
//
//  Created by Abdulla Civuli on 16.11.24.
//

import Foundation
import UIKit

class CommonUtils: NSObject {
    static let shared = CommonUtils()
    
    // MARK: - Font Names
    private enum FontName {
        static let light18 = "Inter_18pt-Light"
        static let semiBold18 = "Inter_18pt-SemiBold"
        static let light24 = "Inter_24pt-Light"
        static let semiBold24 = "Inter_24pt-SemiBold"
        static let arabic = "UthmanTN1BVer07" // Spaces are typically removed in PostScript names
    }
    
    // MARK: - Font Methods
    func getLightFont18(size fontSize: CGFloat) -> UIFont {
        guard let font = UIFont(name: FontName.light18, size: fontSize) else {
            return UIFont.systemFont(ofSize: fontSize, weight: .light) // Fallback font
        }
        return font
    }

    func getBoldFont18(size fontSize: CGFloat) -> UIFont {
        guard let font = UIFont(name: FontName.semiBold18, size: fontSize) else {
            return UIFont.systemFont(ofSize: fontSize, weight: .semibold) // Fallback font
        }
        return font
    }

    func getArabicFont(size fontSize: CGFloat) -> UIFont {
        guard let font = UIFont(name: FontName.arabic, size: fontSize) else {
            return UIFont.systemFont(ofSize: fontSize) // Fallback font
        }
        return font
    }
}
