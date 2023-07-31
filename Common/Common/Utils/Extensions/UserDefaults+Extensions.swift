//
//  UserDefaults+Extensions.swift
//  Common
//
//  Created by Brayan Munoz Campos on 31/07/23.
//

extension UserDefaults {
    
    enum UserDefaultsKeys: String {
        case saveEmail
    }
    
    public func setSaveEmailValue(value: Bool) {
        set(value, forKey: UserDefaultsKeys.saveEmail.rawValue)
        synchronize()
    }
    
    public func getSaveEmailValue() -> Bool {
        return bool(forKey: UserDefaultsKeys.saveEmail.rawValue)
    }
    
    public func removeAll() {
        self.setSaveEmailValue(value: false)
    }
}
