//
//  SplashRouter.swift
//  TCBancom
//
//  Created by Brayan Munoz Campos on 27/07/23.
//

import UIKit

protocol SplashRouterProtocol: AnyObject {
    func startModule()
    func routeToLogIn()
}

class SplashRouter {
    
    private weak var view: UIViewController?
    
    init(view: UIViewController) {
        self.view = view
    }
}

extension SplashRouter: SplashRouterProtocol {
    
    func startModule() {
    }
    
    func routeToLogIn() {
        
    }
}
