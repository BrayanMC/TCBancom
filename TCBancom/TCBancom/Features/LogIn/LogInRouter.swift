//
//  LogInRouter.swift
//  TCBancom
//
//  Created by Brayan Munoz Campos on 30/07/23.
//

import UIKit

protocol LogInRouterProtocol: AnyObject {
}

class LogInRouter {
    
    private let navigation: UINavigationController
    
    init(navigation: UINavigationController) {
        self.navigation = navigation
    }
    
    func getViewController() -> UIViewController {
        LogInViewController.build(router: self)
    }
}

extension LogInRouter: LogInRouterProtocol {
}
