//
//  CheckButton.swift
//  UIComponents
//
//  Created by Brayan Munoz Campos on 30/07/23.
//

import UIKit
import Common

protocol CheckDelegate: AnyObject {
    func valueChanged(_ sender: CheckButton, isChecked: Bool)
}

public class CheckButton: UIButton {

    private var _code: Int = CheckButtonCodes.check01.rawValue
    weak var delegate: CheckDelegate?
    public var isChecked: Bool = false {
        didSet {
            switch self._code {
            case CheckButtonCodes.check01.rawValue:
                if (self.isChecked) {
                    self.setImage(ImageManager.shared.icCheckOn, for: .normal)
                } else {
                    self.setImage(ImageManager.shared.icCheckOff, for: .normal)
                }
            default:
                if (self.isChecked) {
                    self.setImage(ImageManager.shared.icCheckOn, for: .normal)
                } else {
                    self.setImage(ImageManager.shared.icCheckOff, for: .normal)
                }
            }
            self.delegate?.valueChanged(self, isChecked: self.isChecked)
        }
    }

    @IBInspectable var code: Int {
        get {
            return self._code
        }
        set {
            self._code = Int(newValue)
        }
    }

    public override func awakeFromNib() {
        self.addTarget(self, action: #selector(self.buttonClicked(sender:)), for: UIControl.Event.touchUpInside)
        self.isChecked = false
    }

    public func getIsChecked() -> Bool {
        return self.isChecked
    }
    
    @objc func buttonClicked(sender: UIButton) {
        if sender == self {
            self.isChecked = !self.isChecked
        }
    }
}
