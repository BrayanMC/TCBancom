//
//  String+Extensions.swift
//  Common
//
//  Created by Brayan Munoz Campos on 30/07/23.
//

import UIKit

extension String {
    
    static var empty = ""
    
    private enum StringValidation {
        case email
        case password
        case capitalLetter
        case number
        case specialCharacter
    }

    private func isValid(type: StringValidation) -> Bool {
        var regularExp = ""
        switch type {
        case .email:
            regularExp = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        case .password:
            regularExp = ".{\(PasswordFormatConstants.maxCharacters)}"
        case .capitalLetter:
            regularExp = ".*[A-Z]+.*"
        case .number:
            regularExp = ".*[0-9]+.*"
        case .specialCharacter:
            regularExp = ".*[!&^%$#@()/]+.*"
        }
        let test = NSPredicate(format: "SELF MATCHES %@", regularExp)
        return test.evaluate(with: self)
    }
    
    public var isBlank: Bool {
        get {
            let trimmed = trimmingCharacters(in: .whitespaces)
            return trimmed.isEmpty
        }
    }
    
    public var isValidEmail: Bool {
        return self.isValid(type: .email)
    }
    
    public var hasUppercaseAndLowercaseLetters: Bool {
        return self.isValid(type: .capitalLetter)
    }
    
    public var hasNumbers: Bool {
        return self.isValid(type: .number)
    }
    
    var hasSpecialCharacters: Bool {
        return self.isValid(type: .specialCharacter)
    }
    
    public var isPasswordCorrect: Bool {
        print("\(self) hasUppercaseAndLowercaseLetters: \(self.hasUppercaseAndLowercaseLetters)")
        print("\(self) hasNumbers: \(self.hasNumbers)")
        print("\(self) hasSpecialCharacters: \(self.hasSpecialCharacters)")
        return self.hasUppercaseAndLowercaseLetters && self.hasNumbers && self.hasSpecialCharacters
    }
    
    public var isValidPassword: Bool {
        return self.isValid(type: .password)
    }
    
    public func hasEmoticon() -> Bool {
        return self.containsEmoji
    }
    
    public var containsEmoji: Bool {
        for scalar in unicodeScalars {
            switch scalar.value {
            case 0x1F600...0x1F64F, // Emoticons
                0x1F300...0x1F5FF, // Misc Symbols and Pictographs
                0x1F680...0x1F6FF, // Transport and Map
                0x2600...0x26FF, // Misc symbols
                0x2700...0x27BF, // Dingbats
                0xFE00...0xFE0F, // Variation Selectors
                0x1F900...0x1F9FF, // Supplemental Symbols and Pictographs
                0x1F1E6...0x1F1FF,
                127000...127600, // Various asian characters
                65024...65039, // Variation selector
                9100...9300, // Misc items
                8400...8447: // Flags
                return true
            default:
                continue
            }
        }
        return false
    }
}
