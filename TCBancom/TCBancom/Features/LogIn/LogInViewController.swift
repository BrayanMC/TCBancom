//
//  LogInViewController.swift
//  TCBancom
//
//  Created by Brayan Munoz Campos on 30/07/23.
//

import UIKit
import Common
import UIComponents

protocol LogInViewControllerProtocol: ViewProtocol {
    var presenter: LogInPresenter? { get }
    func showError(message: String, fieldId: Int)
    func hideError(fieldId: Int)
}

extension LogInViewController {
    
    static func build(router: LogInRouterProtocol) -> UIViewController {
        let vc = LogInViewController(nibName: "LogInViewController", bundle: nil)
        vc.presenter = LogInPresenter(view: vc, router: router)
        return vc
    }
}

class LogInViewController: BaseViewController {
    
    @IBOutlet weak var emailCustomTextField: CustomTextField!
    @IBOutlet weak var passwordCustomTextField: CustomTextField!
    @IBOutlet weak var forgotMyPasswordLabel: UILabel!
    @IBOutlet weak var rememberEmailCheckButton: CheckButton!
    
    internal var presenter: LogInPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        self.setUpView()
    }
    
    private func setUpView() {
        self.setUpTextFields()
    }
    
    private func setUpTextFields() {
        self.emailCustomTextField.displayView(floatingText: "Correo electrónico", placeholder: "Correo electrónico", textFieldType: .Email(maxCharacters: GlobalConstants.email), id: 1)
        self.passwordCustomTextField.displayView(floatingText: "Contraseña", placeholder: "Contraseña", rightIcon: ImageManager.shared.icUnselectedEye, rightIconSelected: ImageManager.shared.icSelectedEye, keyboardType: .Numeric, textFieldType: .Password(maxCharacters: PasswordFormatConstants.maxCharacters), id: 2)
    }
    
    private func addGesture(to label: UILabel) {
        label.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.forgotMyPasswordLabelTapped(_ :)))
        label.addGestureRecognizer(tapGesture)
    }
    
    private func validateForm() {
        let email = self.emailCustomTextField.getTextValue()
        let password = self.passwordCustomTextField.getTextValue()
        
        self.presenter?.validateEmail(email: email, id: self.emailCustomTextField.getId())
        self.presenter?.validatePassword(password: password, id: self.passwordCustomTextField.getId())
        
        if (!self.passwordCustomTextField.hasError && !self.emailCustomTextField.hasError) {
            
        }
    }
    
    @objc func forgotMyPasswordLabelTapped(_ gesture: UITapGestureRecognizer) {
        guard let text = self.forgotMyPasswordLabel.text else { return }
        let range = (text as NSString).range(of: text)
        if gesture.didTapAttributedTextInLabel(label: self.forgotMyPasswordLabel, inRange: range) {
        }
    }
    
    @IBAction func enterToCustomButtonTapped(_ sender: Any) {
        self.validateForm()
    }
}

extension LogInViewController: LogInViewControllerProtocol {
    
    func startLoading() {
        ProgressView.showSpinner(inView: self.view)
    }
    
    func finishedLoading() {
        ProgressView.hideSpinner(inView: self.view)
    }
    
    func showError(message: String, fieldId: Int) {
        switch fieldId {
        case self.passwordCustomTextField.getId():
            self.passwordCustomTextField.hasError = true
            self.passwordCustomTextField.errorText = message
        default:
            break
        }
    }
    
    func hideError(fieldId: Int) {
        switch fieldId {
        case self.passwordCustomTextField.getId():
            self.passwordCustomTextField.cleanError()
        default:
            break
        }
    }
}
