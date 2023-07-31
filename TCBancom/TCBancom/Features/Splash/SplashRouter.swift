//
//  SplashRouter.swift
//  TCBancom
//
//  Created by Brayan Munoz Campos on 27/07/23.
//

import UIKit

protocol SplashRouterProtocol: AnyObject {
    func routeToLogIn()
}

class SplashRouter {
    
    private weak var view: UIViewController?
    
    init(view: UIViewController) {
        self.view = view
    }
}

extension SplashRouter: SplashRouterProtocol {
    
    func routeToLogIn() {
        guard let navigation = self.view?.navigationController else { return }
        let vc = LogInRouter(navigation: navigation).getViewController()
        navigation.setViewControllers([vc], animated: true)
    }
}
