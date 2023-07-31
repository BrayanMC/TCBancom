//
//  UIButton+Extensions.swift
//  Common
//
//  Created by Brayan Munoz Campos on 30/07/23.
//

import UIKit

extension UIButton {
    
    public func enable() {
        self.isEnabled = true
        self.alpha = 1
    }

    public func disable() {
        self.isEnabled = false
        self.alpha = 0.3
    }
}
