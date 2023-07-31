//
//  UserInteractor.swift
//  Domain
//
//  Created by Brayan Munoz Campos on 31/07/23.
//

import PromiseKit

public protocol UserInteractorProtocol {
    func getUsers() -> Promise<[UserModel.GetUsers.User]>
}

public class UserInteractor: Interactor, UserInteractorProtocol {
    
    var userRepository: UserRepository!
    
    public override init(repository: Any) {
        super.init(repository: repository)
        
        self.userRepository = self.repository as? UserRepository
    }
    
    public func getUsers() -> Promise<[UserModel.GetUsers.User]> {
        self.userRepository.getUsers()
    }
}

