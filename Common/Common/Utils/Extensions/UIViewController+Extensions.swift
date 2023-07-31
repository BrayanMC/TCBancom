//
//  UIViewController+Extensions.swift
//  Common
//
//  Created by Brayan Munoz Campos on 31/07/23.
//

import UIKit

extension UIViewController {
    
    private func showPopUpNative(title: String? = "",
                                 message: String,
                                 actionTitle: String? = nil,
                                 cancelTitle: String? = nil,
                                 completion: (() -> Void)? = nil) {
        let controller = UIAlertController(title: title, message: message, preferredStyle: .alert)
        if (cancelTitle != nil) {
            let cancel = UIAlertAction(title: cancelTitle, style: .cancel, handler: { _ in
                if actionTitle == nil {
                    completion?()
                }
            })
            controller.addAction(cancel)
        }
        
        if let actionTitle = actionTitle {
            let action = UIAlertAction(title: actionTitle, style: .default, handler: { _ in
                completion?()
            })
            controller.addAction(action)
        }
        self.present(controller, animated: true, completion: nil)
    }
    
    public func showOneButtonAlert(title: String? = "",
                       message: String,
                       actionTitle: String? = "Ok",
                       completion: (() -> Void)? = nil) {
        self.showPopUpNative(title: title,
                        message: message,
                        actionTitle: actionTitle,
                        completion: completion)
    }
    
    public func showTwoButtonsAlert(title: String? = "",
                       message: String,
                       actionTitle: String? = "Sí",
                       cancelTitle: String? = "No",
                       completion: (() -> Void)? = nil) {
        self.showPopUpNative(title: title,
                        message: message,
                        actionTitle: actionTitle,
                        cancelTitle: cancelTitle,
                        completion: completion)
    }
}

