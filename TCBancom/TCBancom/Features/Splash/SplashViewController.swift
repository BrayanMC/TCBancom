//
//  SplashViewController.swift
//  TCBancom
//
//  Created by Brayan Munoz Campos on 27/07/23.
//

import UIKit

protocol SplashScreenViewControllerProtocol: AnyObject {
    var presenter: SplashPresenter? { get }
}

class SplashViewController: BaseViewController {
    
    public var presenter: SplashPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func goToLogIn() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            
        }
    }
}

extension SplashViewController: SplashScreenViewControllerProtocol {
}
