//
//  UsersPresenter.swift
//  TCBancom
//
//  Created by Brayan Munoz Campos on 31/07/23.
//

import Data
import Domain

protocol UsersPresenterProtocol: AnyObject {
    func getUsers()
}

class UsersPresenter {
    
    private unowned let view: UsersViewControllerProtocol
    private let userInteractorProtocol: UserInteractorProtocol
    private let postInteractorProtocol: PostInteractorProtocol
    private let router: UsersRouterProtocol
    
    init(view: UsersViewControllerProtocol, router: UsersRouterProtocol) {
        self.view = view
        self.userInteractorProtocol = UserInteractor(repository: UserDataRepository.sharedInstance)
        self.postInteractorProtocol = PostInteractor(repository: PostDataRepository.sharedInstance)
        self.router = router
    }
}

extension UsersPresenter: UsersPresenterProtocol {
    
    func getUsers() {
        if (RepositoryRemote.sharedInstance.hasNetworkConnection()) {
            self.userInteractorProtocol.getUsers().done { response in
                print("Users - getUsers(): \(response)")
                self.view.showUsers(data: response)
            }.catch { error in
                print("Users - getUsers() | Error: \(error)")
                self.view.showAlert(title: "Ocurrió un error", message: error.localizedDescription, actionTitle: "Ok") {
                }
            }.finally {
                print("Users - getUsers() | Request is complete 🎉")
            }
        } else {
            self.view.showAlert(title: "", message: "No tiene conexión a internet", actionTitle: "Reintentar") {
                self.getUsers()
            }
        }
    }
}
