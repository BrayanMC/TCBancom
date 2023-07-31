//
//  LogInRouter.swift
//  TCBancom
//
//  Created by Brayan Munoz Campos on 30/07/23.
//

import UIKit

protocol LogInRouterProtocol: AnyObject {
    func routeToPosts()
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
    
    func routeToPosts() {
        let vc = UsersRouter(navigation: self.navigation).getViewController()
        self.navigation.setViewControllers([vc], animated: true)
    }
}
