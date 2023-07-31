//
//  UserCredentials.swift
//  Data
//
//  Created by Brayan Munoz Campos on 31/07/23.
//

import KeychainAccess
import UIKit

public class UserCredentials {
    public static let shared = UserCredentials()
    
    private let keychain = Keychain(service: "com.bmunoz.tcbancom")
    private let emailKey = "email"
    
    private init() {}
    
    public var email: String? {
        get {
            return self.keychain[string: self.emailKey]
        }
        set {
            self.keychain[string: self.emailKey] = newValue
        }
    }
}
