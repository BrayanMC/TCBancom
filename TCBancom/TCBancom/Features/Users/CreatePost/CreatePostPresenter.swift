//
//  CreatePostPresenter.swift
//  TCBancom
//
//  Created by Brayan Munoz Campos on 31/07/23.
//

import Data
import Domain

protocol CreatePostPresenterProtocol: AnyObject {
    func createPost(userId: Int, title: String, body: String)
}

class CreatePostPresenter {
    
    private unowned let view: CreatePostViewControllerProtocol
    private let postInteractorProtocol: PostInteractorProtocol
    private let router: CreatePostRouterProtocol
    private var viewData: CreatePostViewData
    
    init(view: CreatePostViewControllerProtocol, router: CreatePostRouterProtocol, viewData: CreatePostViewData) {
        self.view = view
        self.postInteractorProtocol = PostInteractor(repository: PostDataRepository.sharedInstance)
        self.router = router
        self.viewData = viewData
    }
}

extension CreatePostPresenter: CreatePostPresenterProtocol {
    
    func createPost(userId: Int, title: String, body: String) {
        if (RepositoryRemote.sharedInstance.hasNetworkConnection()) {
            self.view.startLoading()
            self.postInteractorProtocol.createPost(params: PostModel.CreatePostParams(userId: userId, title: title, body: body)).done { response in
                print("Create post - createPost(...): \(response)")
            }.catch { error in
                print("Create post - createPost(...) | Error: \(error)")
                self.view.finishedLoading()
                self.view.showAlert(title: "Ocurrió un error", message: error.localizedDescription, actionTitle: "Ok") {
                }
            }.finally {
                print("Create post - createPost(...) | Request is complete 🎉")
                self.view.finishedLoading()
            }
        } else {
            self.view.showAlert(title: "", message: "No tiene conexión a internet", actionTitle: "Reintentar") {
                self.createPost(userId: userId, title: title, body: body)
            }
        }
    }
}
