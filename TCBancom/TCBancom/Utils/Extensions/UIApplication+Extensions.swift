//
//  UIApplication+Extensions.swift
//  TCBancom
//
//  Created by Brayan Munoz Campos on 31/07/23.
//

import UIKit

extension UIApplication {
    
    static var window: UIWindow? {
        return UIApplication.shared.windows.first { $0.isKeyWindow }
    }
}
