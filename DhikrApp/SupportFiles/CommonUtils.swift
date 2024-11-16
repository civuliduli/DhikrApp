//
//  CommonUtils.swift
//  DhikrApp
//
//  Created by Abdulla Civuli on 16.11.24.
//

import Foundation
import UIKit

class CommonUtils: NSObject {
    // Fonts
    func getLightFont18(size fontSize: CGFloat) -> UIFont {
        return UIFont(name: "Inter_18pt-Light", size: fontSize)!
    }
    
    func getBoldFont18(size fontSize: CGFloat) -> UIFont {
        return UIFont(name: "Inter_18pt-SemiBold", size: fontSize)!
    }
    
    func getArabicFont(size fontSize: CGFloat) -> UIFont {
        return UIFont(name: "UthmanTN1B Ver07", size: fontSize)!
    }
}
