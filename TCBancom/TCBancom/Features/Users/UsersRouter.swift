//
//  UsersRouter.swift
//  TCBancom
//
//  Created by Brayan Munoz Campos on 31/07/23.
//

import UIKit

protocol UsersRouterProtocol: AnyObject {
    func routeToCreatePost(userId: Int)
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
    
    func routeToCreatePost(userId: Int) {
        let viewData = CreatePostViewData(userId: userId)
        let vc = CreatePostRouter(navigation: self.navigation).getViewController(viewData: viewData)
        self.navigation.present(vc, animated: true)
    }
}
