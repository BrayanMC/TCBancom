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
    
    public func animateBottomSheet(show: Bool, onCompleted: (() -> Void)?) {
        if show {
            frame.origin.y += frame.height
            UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 4, options: .curveEaseIn, animations: {
                self.frame.origin.y -= self.frame.height
                if onCompleted != nil {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        onCompleted!()
                    }
                }
            })
            return
        }
        
        UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 4, options: .curveEaseIn, animations: {
            self.frame.origin.y += self.frame.height
            self.animateOverlay()
            if onCompleted != nil{
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                    onCompleted!()
                }
            }
        })
    }
    
    public func animateOverlay(delay : TimeInterval = 0.0) {
        self.alpha = 0
        UIView.animate(withDuration: 0.2, delay: delay, options: .curveEaseIn, animations: {
            self.alpha = 1.0
        })
    }
    
    public func roundTopCorners(radius: CGFloat) {
        self.clipsToBounds = true
        self.layer.cornerRadius = radius
        self.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
}

