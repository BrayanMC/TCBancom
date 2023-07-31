//
//  Headers.swift
//  Data
//
//  Created by Brayan Munoz Campos on 31/07/23.
//

import Foundation
import Alamofire
import SwiftKeychainWrapper

enum Headers {

    case Header_Default
    
    func getHeader() -> HTTPHeaders {
        switch self {
        case .Header_Default:
            return [
                "Content-Type": "application/json"
            ]
        }
    }

    func getDeviceOS() -> String {
        return "IOS"
    }
    
    func getVersion() -> String {
        return Bundle.main.infoDictionary?["CFBundleShortVersionString"] as! String
    }
}
