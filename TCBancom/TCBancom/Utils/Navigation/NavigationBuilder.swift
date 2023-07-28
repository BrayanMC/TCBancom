//
//  NavigationBuilder.swift
//  TCBancom
//
//  Created by Brayan Munoz Campos on 27/07/23.
//

import UIKit

typealias NavigationFactory = (UIViewController) -> (UINavigationController)

class NavigationBuilder {
    
    static func build(rootView: UIViewController) -> UINavigationController {
        let navigationController = NavigationController(rootViewController: rootView)
        navigationController.navigationBar.isHidden = true
        return navigationController
    }
}

class NavigationBarBuilder {
    
    static func build(rootView: UIViewController) -> UINavigationController {
        let navigationController = NavigationController(rootViewController: rootView)
        navigationController.navigationBar.isHidden = false
        return navigationController
    }
}
