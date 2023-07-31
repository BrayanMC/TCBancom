//
//  CustomTextField+Extensions.swift
//  UIComponents
//
//  Created by Brayan Munoz Campos on 30/07/23.
//

import UIKit

extension CustomTextField {

    open override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        return false
    }
    
    func setHelperText(text: String, color: UIColor, font: UIFont) {
        self.helperTextLabel.font = font
        self.helperTextLabel.text = text
        self.helperTextLabel.textColor = color
        self.helperTextLabel.isHidden = false
    }
    
    func setFloatingLabelColor(color: UIColor) {
        self.floatingLabel.textColor = color
    }
    
    func setPlaceholderColor(color: UIColor) {
        self.textField.attributedPlaceholder = NSAttributedString(
            string: self.textField.placeholder ?? "",
            attributes: [NSAttributedString.Key.foregroundColor: color]
        )
    }
    
    func setBorderColor(color: UIColor) {
        self.textField.layer.borderColor = color.cgColor
    }

    func setTextColor(color: UIColor) {
        self.textField.textColor = color
    }
    
    func setDefaultTextFieldContainer(floatingLabelColor: UIColor, placeholderColor: UIColor, borderColor: UIColor) {
        self.floatingLabel.textColor = floatingLabelColor
        self.textField.attributedPlaceholder = NSAttributedString(
            string: self.textField.placeholder ?? "",
            attributes: [NSAttributedString.Key.foregroundColor: placeholderColor]
        )
        self.textField.layer.borderColor = borderColor.cgColor
    }
    
    func setErrorTextFieldContainer(color: UIColor) {
        self.textField.layer.borderColor = color.cgColor
    }
    
    func addToolbar(barButtonSelector: (target: Any, action: Selector), withTitle title: String) {
        let barButtonSelector = barButtonSelector
        let toolbar: UIToolbar = UIToolbar()
        let barButtonItem = UIBarButtonItem(title: title, style: .done, target: barButtonSelector.target, action: barButtonSelector.action)
        toolbar.barStyle = .default
        barButtonItem.tintColor = UIColor.black
        toolbar.items = [
            UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil),
            barButtonItem
        ]
        toolbar.sizeToFit()
        self.textField.inputAccessoryView = toolbar
    }
}

