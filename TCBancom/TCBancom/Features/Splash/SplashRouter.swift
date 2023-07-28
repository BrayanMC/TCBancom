//
//  SplashRouter.swift
//  TCBancom
//
//  Created by Brayan Munoz Campos on 27/07/23.
//

import UIKit

protocol SplashRouterProtocol: AnyObject {
    func startModule()
}

class SplashRouter {
    
    private weak var appViewController: AppViewControllerProtocol?
    private weak var view: UIViewController?
    
    init(appViewController: AppViewControllerProtocol) {
        self.appViewController = appViewController
    }
    
    init(view: UIViewController) {
        self.view = view
    }
}

extension SplashRouter: SplashRouterProtocol {
    
    func startModule() {
        let navigationController = SplashScreenAssembly.buildNavigation(usingNavigationFactory: NavigationBuilder.build)
        self.appViewController?.updateCurrent(to: navigationController)
    }
}
