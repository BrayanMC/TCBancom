//
//  LogInPresenter.swift
//  TCBancom
//
//  Created by Brayan Munoz Campos on 30/07/23.
//

import Common
import Data

protocol LogInPresenterProtocol: AnyObject {
    func validateEmail(email: String, id: Int)
    func validatePassword(password: String, id: Int)
    func goToPosts()
    func validateIsEmailIsInKeychain()
}

class LogInPresenter {
    
    private unowned let view: LogInViewControllerProtocol
    private let router: LogInRouterProtocol
    
    init(view: LogInViewControllerProtocol, router: LogInRouterProtocol) {
        self.view = view
        self.router = router
    }
}

extension LogInPresenter: LogInPresenterProtocol {
    
    func validateIsEmailIsInKeychain() {
        if (UserDefaults.standard.getSaveEmailValue()) {
            self.view.showEmailFromKeychain(email: UserCredentials.shared.email ?? "")
        }
    }
    
    func validateEmail(email: String, id: Int) {
        if (email.isBlank) {
            self.view.showError(message: "Ingrese su correo electrónico", fieldId: id)
            return
        }
        
        if (!email.isValidEmail) {
            self.view.showError(message: "Correo electrónico no es válido", fieldId: id)
            return
        }
        
        self.view.hideError(fieldId: id)
    }
    
    func validatePassword(password: String, id: Int) {
        if (password.isBlank) {
            self.view.showError(message: "Ingrese su contraseña", fieldId: id)
            return
        }
        
        if (!password.isValidPassword) {
            self.view.showError(message: "Contraseña no es válida", fieldId: id)
            return
        }
        
        self.view.hideError(fieldId: id)
    }
    
    func goToPosts() {
        self.view.startLoading()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            if (self.view.saveEmailIsChecked()) {
                UserCredentials.shared.email = self.view.getEmail()
                UserDefaults.standard.setSaveEmailValue(value: true)
            } else {
                UserCredentials.shared.email = ""
                UserDefaults.standard.setSaveEmailValue(value: false)
            }
            self.view.finishedLoading()
            self.router.routeToPosts()
        }
    }
}
