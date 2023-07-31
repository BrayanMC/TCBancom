//
//  CustomButton.swift
//  UIComponents
//
//  Created by Brayan Munoz Campos on 30/07/23.
//

import UIKit
import Common

public class CustomButton: UIButton {
    
    private var _code: Int = CustomButtonCodes.primary.rawValue
    
    @IBInspectable var code: Int {
          get {
            return self._code
          }
          set {
            self._code = Int(newValue)
            self.updateStyles()
          }
    }
    
    public override var isHighlighted: Bool {
        didSet {
            self.alpha = isHighlighted ? 0.88 : 1
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.customBuilder()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.customBuilder()
    }

    func customBuilder() {
        self.setCornerRadius = 12
        self.setPrimaryButton()
    }
    
    private func updateStyles() {
        switch self._code {
        case CustomButtonCodes.primary.rawValue:
            self.setPrimaryButton()
            break
        case CustomButtonCodes.secondary.rawValue:
            self.setSecondaryButton()
            break
        default: break
        }
    }

    public func mode(isActive: Bool) {
        if (isActive) {
            self.enable()
        } else {
            self.disable()
        }
    }
    
    public func setTitle(_ title: String) {
        self.setTitle(title, for: .normal)
        self.setTitle(title, for: .disabled)
        self.setTitle(title, for: .selected)
        self.setTitle(title, for: .highlighted)
    }

    public func setPrimaryButton() {
        self.titleLabel?.font = UIFont.nunitoBold16
        self.titleLabel?.textColor = ColorManager.shared.gray0
        self.titleLabel?.tintColor = ColorManager.shared.gray0
        self.backgroundColor = ColorManager.shared.red100
    }

    public func setSecondaryButton() {
        self.titleLabel?.font = UIFont.nunitoBold16
        self.titleLabel?.textColor = ColorManager.shared.red100
        self.titleLabel?.tintColor = ColorManager.shared.red100
        self.backgroundColor = ColorManager.shared.gray0
        self.setBorderColor = ColorManager.shared.red100
        self.setBorderWidth = 2.0
    }
}
