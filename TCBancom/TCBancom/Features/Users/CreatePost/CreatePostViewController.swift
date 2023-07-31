//
//  CreatePostViewController.swift
//  TCBancom
//
//  Created by Brayan Munoz Campos on 31/07/23.
//

import UIKit
import Common
import UIComponents

protocol CreatePostViewControllerProtocol: ViewProtocol {
    var presenter: CreatePostPresenter? { get }
    func showAlert(title: String, message: String, actionTitle: String, completion: (() -> Void)?)
    func hideBottomSheet()
}

extension CreatePostViewController {
    
    static func build(router: CreatePostRouterProtocol, viewData: CreatePostViewData) -> UIViewController {
        let vc = CreatePostViewController(nibName: "CreatePostViewController", bundle: nil)
        vc.presenter = CreatePostPresenter(view: vc, router: router, viewData: viewData)
        vc.modalPresentationStyle = .overCurrentContext
        return vc
    }
}

class CreatePostViewController: BaseViewController {
    
    @IBOutlet weak var overlayView: UIView!
    @IBOutlet weak var bottomSheetView: UIView!
    @IBOutlet weak var titleCustomTextField: CustomTextField!
    @IBOutlet weak var bodyCustomTextField: CustomTextField!
    @IBOutlet weak var saveCustomButton: CustomButton!
    
    internal var presenter: CreatePostPresenter?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.bottomSheetView.animateBottomSheet(show: true) {
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpView()
    }
    
    private func setUpView() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.overlayViewTapped(_:)))
        self.overlayView.addGestureRecognizer(tapGesture)
        self.setUpTextFields()
    }
    
    private func setUpTextFields() {
        self.titleCustomTextField.displayView(floatingText: "Título", placeholder: "Título", keyboardType: .Default, textFieldType: .Default, id: 1)
        self.bodyCustomTextField.displayView(floatingText: "Descripción", placeholder: "Descripción", keyboardType: .Default, textFieldType: .Default, id: 2)
    }
    
    @objc func overlayViewTapped(_ sender: UITapGestureRecognizer) {
        self.bottomSheetView.animateBottomSheet(show: false) {
            self.dismiss(animated: false)
        }
    }
    
    @IBAction func saveCustomButtonTapped(_ sender: Any) {
        self.presenter?.createPost(userId: 1, title: self.titleCustomTextField.getTextValue(), body: self.bodyCustomTextField.getTextValue())
    }
}

extension CreatePostViewController: CreatePostViewControllerProtocol {
    
    func startLoading() {
        ProgressView.showSpinner(inView: self.view)
    }
    
    func finishedLoading() {
        ProgressView.hideSpinner(inView: self.view)
    }
    
    func showAlert(title: String, message: String, actionTitle: String, completion: (() -> Void)? = nil) {
        self.showOneButtonAlert(title: title, message: message, actionTitle: actionTitle) {
            completion?()
        }
    }
    
    func hideBottomSheet() {
        self.bottomSheetView.animateBottomSheet(show: false) {
            self.dismiss(animated: false) {
            }
        }
    }
}
