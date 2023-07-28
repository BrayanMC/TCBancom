//
//  SplashScreenAssembly.swift
//  TCBancom
//
//  Created by Brayan Munoz Campos on 27/07/23.
//

import UIKit

class SplashScreenAssembly {
    
    static func buildNavigation(usingNavigationFactory factory: NavigationFactory) -> UINavigationController {
        let storyboard = UIStoryboard(name: "SplashViewController", bundle: Bundle.main)
        let view = storyboard.instantiateViewController(withIdentifier: "SplashViewController") as! SplashViewController
        let router = SplashRouter(view: view)
        let presenter = SplashPresenter(view: view, router: router)
        view.presenter = presenter
        return factory(view)
    }
}

