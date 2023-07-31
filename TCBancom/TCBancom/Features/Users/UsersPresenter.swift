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
    func getPosts(userId: Int)
    func createPost(userId: Int, title: String, body: String)
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
    
    func getPosts(userId: Int) {
        if (RepositoryRemote.sharedInstance.hasNetworkConnection()) {
            self.postInteractorProtocol.getPosts(params: PostModel.GetPostsByUserIdParams(id: userId)).done { response in
                print("Users - getPosts(...): \(response)")
                self.view.showPosts(data: response)
            }.catch { error in
                print("Users - getPosts(...) | Error: \(error)")
                self.view.showAlert(title: "Ocurrió un error", message: error.localizedDescription, actionTitle: "Ok") {
                }
            }.finally {
                print("Users - getPosts(...) | Request is complete 🎉")
            }
        } else {
            self.view.showAlert(title: "", message: "No tiene conexión a internet", actionTitle: "Reintentar") {
                self.getPosts(userId: userId)
            }
        }
    }
    
    
    func createPost(userId: Int, title: String, body: String) {
        if (RepositoryRemote.sharedInstance.hasNetworkConnection()) {
            self.view.startLoading()
            self.postInteractorProtocol.createPost(params: PostModel.CreatePostParams(userId: userId, title: title, body: body)).done { response in
                print("Users - createPost(...): \(response)")
                self.view.refreshPosts()
            }.catch { error in
                print("Users - createPost(...) | Error: \(error)")
                self.view.finishedLoading()
                self.view.showAlert(title: "Ocurrió un error", message: error.localizedDescription, actionTitle: "Ok") {
                }
            }.finally {
                print("Users - createPost(...) | Request is complete 🎉")
                self.view.finishedLoading()
            }
        } else {
            self.view.showAlert(title: "", message: "No tiene conexión a internet", actionTitle: "Reintentar") {
                self.createPost(userId: userId, title: title, body: body)
            }
        }
    }
}
