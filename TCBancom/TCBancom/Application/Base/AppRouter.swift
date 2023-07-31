//
//  AppRouter.swift
//  TCBancom
//
//  Created by Brayan Munoz Campos on 27/07/23.
//

protocol AppRouterProtocol {
    func startApplication()
}

final class AppRouter {
    
    private let appViewController: AppViewControllerProtocol
    
    init(appViewController: AppViewControllerProtocol) {
        self.appViewController = appViewController
    }
    
    private func startSplashScreenModule() {
        let navigationController = SplashScreenAssembly.buildNavigation(usingNavigationFactory: NavigationBuilder.build)
        self.appViewController.updateCurrent(to: navigationController)
    }
}

extension AppRouter: AppRouterProtocol {
    
    func startApplication() {
        self.startSplashScreenModule()
    }
}
