//
//  CustomTextField.swift
//  UIComponents
//
//  Created by Brayan Munoz Campos on 30/07/23.
//

import UIKit
import Common

public class CustomTextField: UIView {

    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var floatingLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var helperTextLabel: UILabel!
    
    private weak var toolTipDelegate: CustomTextFieldToolTipProtocol?
    private weak var validDelegate: CustomTextFieldValidTextProtocol?
    private weak var shouldChangeCharactersIn: CustomTextFieldShouldChangeCharactersInProtocol?
        
    private var isValid: Bool = false
    private var textFieldType: TextFieldType = .Default
    private var id: String = ""
    private var maxCharactersDefault = 0
    private var isEmojiAllowed: Bool = false
    private var inlineValidation: Bool = false
    
    public var placeholder: String? {
        get {
            return self.textField.placeholder
        }
        set {
            self.textField.placeholder = newValue
        }
    }
    
    public var floatingText: String? {
        get {
            return self.floatingLabel.text
        }
        set {
            self.floatingLabel.text = newValue
        }
    }
    
    public var hasError: Bool = false {
        didSet {
            if (self.hasError) {
                self.setErrorTextFieldContainer(color: self.errorColor ?? .red)
            } else {
                self.setDefaultTextFieldContainer(floatingLabelColor: self.floatingLabelTextColor ?? .black, placeholderColor: self.placeholderColor ?? .gray, borderColor: self.borderActiveColor ?? .black)
            }
        }
    }
    
    public var errorText: String = "" {
        didSet {
            self.setHelperText(text: errorText, color: self.errorColor ?? .red, font: .nunitoRegular10)
        }
    }
    
    public var helperText: String = "" {
        didSet {
            self.setHelperText(text: helperText, color: ColorManager.shared.gray100, font: .nunitoRegular10)
        }
    }
    
    public var isReadOnly: Bool = true {
        didSet {
            self.textField.isEnabled = (self.isReadOnly && self.isEnabled)
        }
    }
    
    public var isEnabled: Bool = true {
       didSet {
           self.textField.isEnabled = self.isEnabled
           if (self.isEnabled) {
               self.borderTextFieldColor = !self.hasError ? self.borderActiveColor : self.errorColor
           } else {
               self.borderTextFieldColor = self.borderActiveColor
           }
       }
    }
    
    public var textColor: UIColor? {
        didSet {
            self.textField.textColor = textColor
        }
    }
    
    public var floatingLabelTextColor: UIColor? {
        didSet {
            self.setFloatingLabelColor(color: self.floatingLabelTextColor ?? .black)
        }
    }
    
    public var placeholderColor: UIColor? {
        didSet {
            self.setPlaceholderColor(color: self.placeholderColor ?? .gray)
        }
    }
    
    public var errorColor: UIColor? {
        didSet {
            self.setErrorTextFieldContainer(color: self.errorColor ?? .red)
        }
    }

    public var borderActiveColor: UIColor? {
        didSet {
            self.borderTextFieldColor = self.borderActiveColor
        }
    }

    public var borderDesactiveColor: UIColor? {
        didSet {
            self.borderTextFieldColor = self.borderDesactiveColor
        }
    }
    
    public var borderTextFieldColor: UIColor? {
        didSet {
            self.setBorderColor(color: self.borderTextFieldColor ?? .black)
        }
    }
    
    public var rightIcon: UIImage? {
        didSet {
            if (self.rightIcon != nil) {
            }
        }
    }
    
    public var rightIconSelected: UIImage? {
        didSet {
            if (self.rightIconSelected != nil) {
            }
        }
    }
    
    private var defaultMode: Bool = true {
        didSet {
            if (self.defaultMode) {
                self.setTextValue(text: "")
                self.helperText = ""
                self.hasError = false
                self.isValid = false
            }
        }
    }
    
    private func config() {
        guard let bundle = Bundle(identifier: "com.bmunoz.UIComponents") else { return }
        bundle.loadNibNamed(CustomTextField.nibName, owner: self, options: nil)
        self.addSubview(self.contentView)
        self.contentView.frame = self.bounds
        self.contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.config()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        self.config()
    }

    convenience init() {
        self.init(frame: .zero)
    }
    
    convenience init(
        toolTipDelegate: CustomTextFieldToolTipProtocol? = nil,
        validDelegate: CustomTextFieldValidTextProtocol? = nil,
        shouldChangeCharactersIn: CustomTextFieldShouldChangeCharactersInProtocol? = nil,
        floatingText: String = "",
        text: String = "",
        placeholder: String? = "",
        leftIcon: UIImage? = nil,
        rightIcon: UIImage? = nil,
        rightIconSelected: UIImage? = nil,
        iconSize: CGSize = CGSize(width: 24, height: 24),
        errorText: String = "",
        errorColor: UIColor = .red,
        textColor: UIColor = ColorManager.shared.gray100,
        floatingLabelTextColor: UIColor = ColorManager.shared.gray100,
        borderActiveColor: UIColor = ColorManager.shared.gray100,
        borderDesactiveColor: UIColor = ColorManager.shared.gray80,
        validateInRealTime: Bool = false,
        isEnabled: Bool = true,
        isReadOnly: Bool = false,
        isHidden: Bool = false,
        keyboardType: KeyboardType = .Default,
        textFieldType: TextFieldType = .Default,
        isEmojiAllowed: Bool = false,
        id: String = ""
    ) {
        self.init(frame: .zero)
        self.displayView(
            toolTipDelegate: toolTipDelegate,
            validDelegate: validDelegate,
            shouldChangeCharactersIn: shouldChangeCharactersIn,
            floatingText: floatingText,
            text: text,
            placeholder: placeholder,
            leftIcon: leftIcon,
            rightIcon: rightIcon,
            rightIconSelected: rightIconSelected,
            iconSize: iconSize,
            errorText: errorText,
            errorColor: errorColor,
            textColor: textColor,
            floatingLabelTextColor: floatingLabelTextColor,
            borderActiveColor: borderActiveColor,
            borderDesactiveColor: borderDesactiveColor,
            validateInRealTime: validateInRealTime,
            isEnabled: isEnabled,
            isReadOnly: isReadOnly,
            isHidden: isHidden,
            keyboardType: keyboardType,
            textFieldType: textFieldType,
            isEmojiAllowed: isEmojiAllowed,
            id: id
        )
    }
    
    public func displayView(
        toolTipDelegate: CustomTextFieldToolTipProtocol? = nil,
        validDelegate: CustomTextFieldValidTextProtocol? = nil,
        shouldChangeCharactersIn: CustomTextFieldShouldChangeCharactersInProtocol? = nil,
        floatingText: String = "",
        text: String = "",
        placeholder: String? = "",
        leftIcon: UIImage? = nil,
        rightIcon: UIImage? = nil,
        rightIconSelected: UIImage? = nil,
        iconSize: CGSize = CGSize(width: 24, height: 24),
        errorText: String = "",
        errorColor: UIColor = .red,
        textColor: UIColor = ColorManager.shared.gray100,
        floatingLabelTextColor: UIColor = ColorManager.shared.gray100,
        borderActiveColor: UIColor = ColorManager.shared.gray100,
        borderDesactiveColor: UIColor = ColorManager.shared.gray80,
        validateInRealTime: Bool = false,
        isEnabled: Bool = true,
        isReadOnly: Bool = false,
        isHidden: Bool = false,
        keyboardType: KeyboardType = .Default,
        textFieldType: TextFieldType = .Default,
        isEmojiAllowed: Bool = false,
        id: String = ""
    ) {
        self.toolTipDelegate = toolTipDelegate
        self.validDelegate = validDelegate
        self.shouldChangeCharactersIn = shouldChangeCharactersIn
        self.id = id
        self.textField.delegate = self
        self.isEmojiAllowed = isEmojiAllowed
        self.placeholder = placeholder
        self.floatingText = floatingText
        self.isHidden = isHidden
        self.isReadOnly = isReadOnly
        self.isEnabled = isEnabled
        self.textColor = textColor
        self.floatingLabelTextColor = floatingLabelTextColor
        self.errorColor = errorColor
        self.borderActiveColor = borderActiveColor
        self.borderDesactiveColor = borderDesactiveColor
        self.borderTextFieldColor = borderActiveColor
        self.inlineValidation = validateInRealTime
        self.initTextField()
        
        self.textFieldType = textFieldType
        switch (self.textFieldType) {
        case .Email:
            self.textField.keyboardType = .emailAddress
            self.textField.autocorrectionType = .no
            break
        case .Password:
            self.textField.isSecureTextEntry = true
            switch keyboardType {
            case .Default, .Numeric:
                self.textField.keyboardType = .numberPad
            case .Alphanumeric:
                self.textField.keyboardType = .namePhonePad
            }
            
            if (leftIcon != nil) {
                let iv = UIImageView(image: leftIcon)
                iv.frame = CGRect(x: CGFloat(0), y: CGFloat(0), width: CGFloat(24), height: CGFloat(24))
                self.textField.setLeftView(iv, padding: 8)
                self.textField.leftViewMode = .always
            }
            
            if (rightIcon != nil) {
                let btn = UIButton(type: .custom)
                btn.frame = CGRect(x: CGFloat(0), y: CGFloat(0), width: CGFloat(24), height: CGFloat(24))
                btn.setImage(rightIcon, for: .normal)
                
                if (rightIconSelected != nil) {
                    btn.setImage(rightIconSelected, for: .selected)
                }
                
                btn.addTarget(self, action: #selector(self.passwordRightIconTap), for: .touchUpInside)
                self.textField.setRightView(btn, padding: 8)
                self.textField.rightViewMode = .always
            }
            break
        case .Default:
            if (leftIcon != nil) {
                let iv = UIImageView(image: leftIcon)
                iv.frame = CGRect(x: CGFloat(0), y: CGFloat(0), width: CGFloat(24), height: CGFloat(24))
                self.textField.setLeftView(iv, padding: 8)
                self.textField.leftViewMode = .always
            }
            break
        }
        
        if (text == "") {
            self.reset()
        } else {
            self.setTextValue(text: text)
        }
    }
    
    private func initTextField() {
        self.textField.layer.cornerRadius = 12.0
        self.floatingLabel.font = .nunitoRegular12
        self.textField.font = .nunitoRegular14
        self.helperTextLabel.font = .nunitoRegular10
        self.setDefaultTextFieldContainer(floatingLabelColor: ColorManager.shared.gray100, placeholderColor: ColorManager.shared.gray80, borderColor: ColorManager.shared.gray100)
        self.textField.setPadding(left: 8.0, right: 8.0)
        self.textField.setUpKeyboardToolbar()
        if (self.inlineValidation) {
            self.textField.addTarget(self, action: #selector(self.textFieldDidChange), for: .editingChanged)
        }
    }
    
    func reset() {
        self.defaultMode = true
        self.layoutIfNeeded()
    }

    func getValid() -> Bool {
        return self.isValid
    }
    
    public func setCenterInputTextStyle() {
        self.textField.textAlignment = .center
    }
    
    public func getTextValue() -> String  {
        return self.textField.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
    }
    
    public func setTextValue(text: String) {
        self.textField.text = text
    }
    
    public func setTextColorValue(color: UIColor) {
        self.setTextColor(color: color)
    }
    
    public func disableInteraction() {
        self.textField.isUserInteractionEnabled = false
    }
    
    public func getTextFieldType() -> TextFieldType {
        return self.textFieldType
    }
    
    public func cleanError() {
        self.helperTextLabel.isHidden = true
        self.helperText = ""
        self.hasError = false
    }
    
    public func getId() -> String {
        return self.id
    }
    
    public func setMaxCharacters(max: Int) {
        self.maxCharactersDefault = max
    }
    
    @objc func passwordRightIconTap(sender: UIButton) {
        sender.isSelected = !sender.isSelected
        self.textField.isSecureTextEntry = !sender.isSelected
    }
    
    @IBAction func customTextFieldChanged(_ textField: UITextField) {
        switch self.textFieldType {
        case .Email(maxCharacters: let maxCharecters):
            if (textField.text!.count == maxCharecters) {
                textField.resignFirstResponder()
            }
            break
        case .Password, .Default:
            break
        }
    }
}

extension CustomTextField: UITextFieldDelegate {
    
    public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if (!self.isEmojiAllowed && string.hasEmoticon()) {
            return false
        }
        
        switch self.textFieldType {
        case .Email(let maxCharacters):
            if (!ValidationUtil.textLimit(existingText: textField.text!.replacingOccurrences(of: ".", with: ""), newText: string.replacingOccurrences(of: ".", with: ""), limit: maxCharacters)) {
                return false
            }
            guard CharacterSet(charactersIn: "0123456789QWERTYUIOPASDFGHJKLÑZXCVBNMqwertyuiopasdfghjklñzxcvbnm.@_-").isSuperset(of: CharacterSet(charactersIn: string)) else {
                return false
            }
            return true
        case .Password(let maxCharacters):
            if (!ValidationUtil.textLimit(existingText: textField.text!.replacingOccurrences(of: ".", with: ""), newText: string.replacingOccurrences(of: ".", with: ""), limit: maxCharacters)) {
                return false
            }
            
            guard CharacterSet(charactersIn: "0987654321QWERTYUIOPASDFGHJKLÑZXCVBNMqwertyuiopasdfghjklñzxcvbnm").isSuperset(of: CharacterSet(charactersIn: string)) else {
                return false
            }
            return true
        case .Default:
            if (self.maxCharactersDefault != 0) {
                if (!ValidationUtil.textLimit(existingText: textField.text!, newText: string, limit: self.maxCharactersDefault)) {
                    return false
                } else {
                    return true
                }
            } else {
                return true
            }
        }
    }
    
    public func textFieldDidBeginEditing(_ textField: UITextField) {
        if (self.isReadOnly) {
            textField.isEnabled = false
            textField.resignFirstResponder()
            textField.isEnabled = true
        }
    }
    
    public func textFieldDidEndEditing(_ textField: UITextField) {
        if (textField.text == "") {
            self.reset()
        }
    }
    
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch self.textFieldType {
        case .Email, .Password, .Default:
            break
        }
        return true
    }
    
    @objc func textFieldAcceptButtonTapped() {
        self.endEditing(true)
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        self.validDelegate?.returnValue(valueReal: textField.text!, id: self.id)
    }
}
