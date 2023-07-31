//
//  SplashPresenter.swift
//  TCBancom
//
//  Created by Brayan Munoz Campos on 27/07/23.
//

protocol SplashPresenterProtocol: AnyObject {
    func goToLogIn()
}

class SplashPresenter {
    
    private unowned let view: SplashScreenViewControllerProtocol
    private let router: SplashRouterProtocol
    
    init(view: SplashScreenViewControllerProtocol, router: SplashRouterProtocol) {
        self.view = view
        self.router = router
    }
}

extension SplashPresenter: SplashPresenterProtocol {
    
    func goToLogIn() {
        self.router.routeToLogIn()
    }
}

