//
//  UsersRouter.swift
//  TCBancom
//
//  Created by Brayan Munoz Campos on 31/07/23.
//

import UIKit

protocol UsersRouterProtocol: AnyObject {
}

class UsersRouter {
    
    private let navigation: UINavigationController
    
    init(navigation: UINavigationController) {
        self.navigation = navigation
    }
    
    func getViewController() -> UIViewController {
        UsersViewController.build(router: self)
    }
}

extension UsersRouter: UsersRouterProtocol {
}