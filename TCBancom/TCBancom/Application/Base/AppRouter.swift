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
        let router: SplashRouterProtocol = SplashRouter(appViewController: self.appViewController)
        router.startModule()
    }
}

extension AppRouter: AppRouterProtocol {
    
    func startApplication() {
        self.startSplashScreenModule()
    }
}
