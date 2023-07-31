//
//  UIView+Extensions.swift
//  Common
//
//  Created by Brayan Munoz Campos on 30/07/23.
//

import UIKit

extension UIView {

    @IBInspectable public var setCornerRadius: CGFloat {
        get {
            return self.layer.cornerRadius
        }
        set {
            self.layer.cornerRadius = newValue
            self.layer.masksToBounds = newValue > 0
        }
    }
    
    @IBInspectable public var setBorderWidth: CGFloat {
        get {
            return self.layer.borderWidth
        }
        set {
            self.layer.borderWidth = newValue
        }
    }
    
    @IBInspectable public var setBorderColor: UIColor? {
        get {
            return UIColor(cgColor: self.layer.borderColor!)
        }
        set {
            self.layer.borderColor = newValue?.cgColor
        }
    }
    
    public func roundCornerTop(value : CGFloat) {
        self.clipsToBounds = true
        self.layer.cornerRadius = value
        self.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    
    public func roundCornerBottom(value: CGFloat) {
        self.clipsToBounds = true
        self.layer.cornerRadius = value
        self.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
    }
    
    public func addShadowToView(shadowColor: UIColor, offset: CGSize, shadowRadius: CGFloat, shadowOpacity: Float) {
        self.layer.shadowColor = shadowColor.cgColor
        self.layer.shadowOpacity = shadowOpacity
        self.layer.shadowOffset = offset
        self.layer.shadowRadius = shadowRadius
        self.layer.masksToBounds = false
    }
}

