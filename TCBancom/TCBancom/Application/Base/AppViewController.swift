//
//  AppViewController.swift
//  TCBancom
//
//  Created by Brayan Munoz Campos on 27/07/23.
//

import UIKit

protocol AppViewControllerProtocol: AnyObject {
    func updateCurrent(to viewController: UIViewController)
}

class AppViewController: BaseViewController {
    private var current: UIViewController?
}

extension AppViewController: AppViewControllerProtocol {
    
    func updateCurrent(to viewController: UIViewController) {
        self.addChild(viewController)
        viewController.view.frame = self.view.bounds
        self.view.addSubview(viewController.view)
        viewController.didMove(toParent: self)
        self.current?.willMove(toParent: nil)
        self.current?.view.removeFromSuperview()
        self.current?.removeFromParent()
        self.current = viewController
    }
}
