//
//  UIFont+AppFont.swift
//  NSCustomButton
//
//  Created by Neeraj Solanki on 22/06/21.
//  Copyright © 2021 Neeraj Solanki. All rights reserved.

import UIKit
extension UIFont {
    
    @objc public static func mediumFont(ofSize : CGFloat) -> UIFont {
        return getCustomFont(fontName: "Cabin-Medium", ofSize: ofSize);
    }
    
    @objc public static func semiBoldItalicFont(ofSize : CGFloat) -> UIFont {
        return getCustomFont(fontName: "Cabin-SemiBoldItalic", ofSize: ofSize);
    }
    
    @objc public static func semiBoldFont(ofSize : CGFloat) -> UIFont {
        return getCustomFont(fontName: "Cabin-SemiBold", ofSize: ofSize);
    }
    
    @objc public static func mediumItalicFont(ofSize : CGFloat) -> UIFont {
        return getCustomFont(fontName: "Cabin-MediumItalic", ofSize: ofSize);
    }
    
    @objc public static func boldItalicFont(ofSize : CGFloat) -> UIFont {
        return getCustomFont(fontName: "Cabin-BoldItalic", ofSize: ofSize);
    }
    
    @objc public static func regularFont(ofSize : CGFloat) -> UIFont {
        return getCustomFont(fontName: "Cabin-Regular", ofSize: ofSize);
    }
    
    @objc public static func boldFont(ofSize : CGFloat) -> UIFont {
        return getCustomFont(fontName: "Cabin-Bold", ofSize: ofSize);
    }
    
    @objc public static func italicFont(ofSize : CGFloat) -> UIFont {
        return getCustomFont(fontName: "Cabin-Italic", ofSize: ofSize);
    }
    
    private static func getCustomFont(fontName: String, ofSize: CGFloat) -> UIFont {
        if let font = UIFont(name: fontName, size: ofSize) {
            return font
        }
        return UIFont.systemFont(ofSize: ofSize)
    }
}
