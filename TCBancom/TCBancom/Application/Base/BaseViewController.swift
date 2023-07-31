//
//  BaseViewController.swift
//  TCBancom
//
//  Created by Brayan Munoz Campos on 27/07/23.
//

import UIKit
import UIComponents

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (self is UsersViewController) {
            self.registerObserverLogOut()
        } else if (self is SplashViewController || self is LogInViewController) {
            self.unregisterObserverLogOut()
        }
    }
    
    func registerObserverLogOut() {
        NotificationCenter.default.addObserver(self, selector: #selector(BaseViewController.logout), name: .logOut, object: nil)
    }
    
    func unregisterObserverLogOut() {
        NotificationCenter.default.removeObserver(self, name: .logOut, object: nil)
    }
    
    @objc func logout(notification: Notification) {
        self.unregisterObserverLogOut()
        self.view.isUserInteractionEnabled = true
        self.logOut()
    }
    
    private func logOut() {
        DispatchQueue.main.async {
            UIView.transition(with: UIApplication.window!, duration: 0.3, options: .transitionFlipFromLeft, animations: {
                self.navigationController?.viewControllers.forEach({ $0.dismiss(animated: false) })
                let vc = LogInRouter(navigation: self.navigationController!).getViewController()
                self.navigationController!.setViewControllers([vc], animated: true)
            }, completion: nil)
        }
    }
    
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        tap.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        self.view.endEditing(true)
    }
    
    private func startLoading() {
        ProgressView.showSpinner(inView: self.view)
    }
    
    private func finishedLoading() {
        ProgressView.hideSpinner(inView: self.view)
    }
}
