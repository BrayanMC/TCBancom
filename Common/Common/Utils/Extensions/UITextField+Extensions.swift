//
//  UITextField+Extensions.swift
//  Common
//
//  Created by Brayan Munoz Campos on 30/07/23.
//

import UIKit

extension UITextField {
    
    @objc func textFieldAcceptButtonTapped() {
        self.endEditing(true)
    }
    
    public func setLeftView(_ view: UIView, padding: CGFloat) {
        view.translatesAutoresizingMaskIntoConstraints = true

        let outerView = UIView()
        outerView.translatesAutoresizingMaskIntoConstraints = false
        outerView.addSubview(view)

        outerView.frame = CGRect(
            origin: .zero,
            size: CGSize(
                width: view.frame.size.width + padding,
                height: view.frame.size.height + padding
            )
        )

        view.center = CGPoint(
            x: (outerView.bounds.size.width / 2) + padding,
            y: outerView.bounds.size.height / 2
        )

        self.leftView = outerView
    }
    
    public func setRightView(_ view: UIView, padding: CGFloat) {
        view.translatesAutoresizingMaskIntoConstraints = true

        let outerView = UIView()
        outerView.translatesAutoresizingMaskIntoConstraints = false
        outerView.addSubview(view)

        outerView.frame = CGRect(
            origin: .zero,
            size: CGSize(
                width: view.frame.size.width + padding,
                height: view.frame.size.height + padding
            )
        )

        view.center = CGPoint(
            x: (outerView.bounds.size.width / 2) - padding,
            y: outerView.bounds.size.height / 2
        )

        self.rightView = outerView
    }
    
    public func setPadding(left: CGFloat, right: CGFloat? = nil) {
        self.setLeftPadding(left)
        if let rightPadding = right {
            setRightPadding(rightPadding)
        }
    }

    private func setLeftPadding(_ padding: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: padding, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }

    private func setRightPadding(_ padding: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: padding, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
    
    public func setUpKeyboardToolbar() {
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = false
        toolBar.sizeToFit()
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(title: "Aceptar", style: UIBarButtonItem.Style.plain, target: self, action: #selector(self.textFieldAcceptButtonTapped))
        toolBar.setItems([spaceButton, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        self.inputAccessoryView = toolBar
    }
}

